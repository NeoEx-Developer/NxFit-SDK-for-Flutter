import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:nxfit_sdk/clients.dart';
import 'package:nxfit_sdk/models.dart';
import 'package:rxdart/rxdart.dart';

import '../../auth/auth_provider.dart';
import '../../auth/auth_state.dart';
import '../../cache/cache_database.dart';
import '../../cache/entities/cached_query_entity.dart';
import '../../cache/entities/integration_entity.dart';
import '../../clients/integration_client.dart';
import '../../exceptions/not_modified_exception.dart';
import '../../managers/integrations_manager.dart';
import '../../models/integration_model.dart';

@internal
class IntegrationsManagerImpl implements IntegrationsManager {
  final String baseRedirectUri;
  final IntegrationClient _integrationClient;
  final LocalIntegrationClient? _localIntegrationClient;
  final CacheDatabase _db;
  final _connectionEvents = StreamController<ConnectionEvent>();
  final _disconnectionEvents = StreamController<DisconnectionEvent>();
  final _integrations = BehaviorSubject<List<IntegrationModel>>();
  final _localIntegrations = BehaviorSubject<List<IntegrationModel>>();
  static const cacheKey = "integrations";
  static const List<IntegrationModel> _allLocalIntegrations = [
    IntegrationModel(identifier: "apple", displayName: "Apple Health", logoUrl: "https://stnxfitcancshared.blob.core.windows.net/public/integrations/apple_health.png", isConnected: false, availability: IntegrationAvailability.unsupported, lastModifiedOn: null),
    IntegrationModel(identifier: "health_connect", displayName: "Google Health Connect", logoUrl: "https://stnxfitcancshared.blob.core.windows.net/public/integrations/google_health_connect.png", isConnected: false, availability: IntegrationAvailability.unsupported, lastModifiedOn: null)
  ];

  IntegrationsManagerImpl._(this.baseRedirectUri, this._db, this._integrationClient, this._localIntegrationClient);

  static Future<IntegrationsManager> build(String baseRedirectUri, AuthProvider authProvider, IntegrationClient client, {CacheDatabase? database, LocalIntegrationClient? localIntegrationClient}) async {
    final _database = database ?? await CacheDatabase.build();
    final manager = IntegrationsManagerImpl._(baseRedirectUri, _database, client, localIntegrationClient);

    Rx.combineLatest2(_database.integrations.streamIntegrations(), manager._localIntegrations, (integrations, localIntegrations) => [...integrations.map((entity) => entity.toModel()).toList(), ...localIntegrations]).listen((integrations) => manager._integrations.value = integrations);

    authProvider.authState.listen((authState) async {
      if (authState.isAuthenticated) {
        await manager.refreshIntegrations();
      }
    });

    return manager;
  }

  @override
  Stream<ConnectionEvent> get connectionEvents => _connectionEvents.stream;

  @override
  Stream<DisconnectionEvent> get disconnectionEvents => _disconnectionEvents.stream;

  @override
  Stream<List<IntegrationModel>> get integrations => _integrations.stream;

  @override
  Future<void> connect(String integrationIdentifier, Future<void> Function(Uri) authorizeAction) async {
    //Check if it is a supported local integration
    final localIntegration = _getLocalIntegration(integrationIdentifier);
    if (localIntegration != null && _localIntegrationClient != null) {
      await _localIntegrationClient!.connect(integrationIdentifier);
      _publishLocalIntegrationUpdate(localIntegration.copyWith(isConnected: true));
      _connectionEvents.add(ConnectionEvent(integrationIdentifier, IntegrationConnectionCode.success));
    } else {
      //final redirectUrl = "${baseRedirectUri}main/profile";
      final redirectUrl = "${baseRedirectUri}nxfit/integrations";
      final integrationConnected = await _integrationClient.connect(integrationIdentifier, redirectUrl);
      final authorizeUrl = integrationConnected.authorizeUrl;

      if (authorizeUrl?.isNotEmpty ?? false) {
        final Uri authorizeUri = Uri.parse(authorizeUrl!);

        await authorizeAction(authorizeUri);
      }
    }
  }

  @override
  Future<IntegrationConnectionCode> handleAuthorizeResponseFromUrl(Uri response) async {
    final integration = response.queryParameters["integration"] ?? "N/A";
    final connectionResult = response.queryParameters["connection"] ?? IntegrationConnectionCode.failure.name;

    return handleAuthorizeResponse(integration, connectionResult);
  }

  @override
  Future<IntegrationConnectionCode> handleAuthorizeResponse(final String integration, final String connectionResultCode) async {
    if (kDebugMode) print(">>>>>>>>>>>>>>> New Integration $integration $connectionResultCode");

    final connectionCode = (connectionResultCode == IntegrationConnectionCode.failure.name) ? IntegrationConnectionCode.failure : IntegrationConnectionCode.success;

    _connectionEvents.add(ConnectionEvent(integration, connectionCode));

    return connectionCode;
  }

  @override
  Future<void> disconnect(String integrationIdentifier) async {
    final localIntegration = _getLocalIntegration(integrationIdentifier);
    if (localIntegration != null && _localIntegrationClient != null) {
      await _localIntegrationClient!.disconnect(integrationIdentifier);
      _publishLocalIntegrationUpdate(localIntegration.copyWith(isConnected: false));
    } else {
      await _integrationClient.disconnect(integrationIdentifier);
    }

    _disconnectionEvents.add(DisconnectionEvent(integrationIdentifier));
  }

  @override
  Future<void> refreshIntegrations() async {
    await _refreshLocalIntegrations();
    await _refreshRemoteIntegrations();
  }

  Future<void> _refreshLocalIntegrations() async {
    List<IntegrationModel> integrations = [];

    if (_localIntegrationClient != null) {
      final localIntegrations = await _localIntegrationClient!.getIntegrations();

      for (final localIntegration in localIntegrations) {
        final integration = _allLocalIntegrations.where((i) => i.identifier == localIntegration.identifier).firstOrNull;

        if (integration != null) {
          integrations.add(integration.copyWith(isConnected: localIntegration.isConnected, availability: localIntegration.availability));
        }
      }
    }

    _localIntegrations.value = integrations;
  }

  Future<void> _refreshRemoteIntegrations() async {
    final cachedQuery = await _db.cachedQueries.get(cacheKey);

    if (kDebugMode) {
      print("CachedQuery: ${cachedQuery?.eTag} ${cachedQuery?.lastModifiedOn}");
    }

    try {
      final integrations = await _integrationClient.listIntegrations(eTag: cachedQuery?.eTag, ifModifiedSince: cachedQuery?.lastModifiedOn?.toUtc());

      if (kDebugMode) {
        print("integrations: ${integrations?.eTag} ${integrations?.lastModifiedOn}");
      }

      await _db.integrations.clear();

      _db.integrations.addOrReplaceIntegrations(integrations.value.map((i) {
        return IntegrationEntity(
          identifier: i.identifier,
          displayName: i.displayName,
          logoUrl: i.logoUrl,
          isConnected: i.isConnected,
          lastModifiedOn: null,
          eTag: null, // TODO; Add this properly
        );
      }).toList());

      await _db.cachedQueries.addOrReplace(CachedQueryEntity(
        key: cacheKey,
        eTag: integrations.eTag,
        lastModifiedOn: integrations.lastModifiedOn?.toUtc(),
      ));

      if (kDebugMode) {
        final cachedQuery2 = await _db.cachedQueries.get(cacheKey);
        print("Fetched integrations: ${integrations?.eTag} ${integrations?.lastModifiedOn}");
        print("Original CachedQuery: ${cachedQuery?.eTag} ${cachedQuery?.lastModifiedOn?.toUtc()}");
        print("Reloaded CachedQuery: ${cachedQuery2?.eTag} ${cachedQuery2?.lastModifiedOn?.toUtc()}");
      }
    } on NotModifiedException catch (e) {
      if (kDebugMode) {
        print("Integrations - Not modified");
      }
    }
  }

  IntegrationModel? _getLocalIntegration(String integrationIdentifier) => _localIntegrations.value.where((integration) => integration.identifier == integrationIdentifier).firstOrNull;

  void _publishLocalIntegrationUpdate(IntegrationModel updatedIntegration) {
    _localIntegrations.value = [..._localIntegrations.value.where((integration) => integration.identifier != updatedIntegration.identifier).toList(), updatedIntegration];
  }
}

extension on IntegrationEntity {
  IntegrationModel toModel() {
    return IntegrationModel(
      identifier: identifier,
      displayName: displayName,
      logoUrl: logoUrl,
      isConnected: isConnected,
      availability: IntegrationAvailability.available,
      lastModifiedOn: null, //lastModifiedOn
    );
  }
}
