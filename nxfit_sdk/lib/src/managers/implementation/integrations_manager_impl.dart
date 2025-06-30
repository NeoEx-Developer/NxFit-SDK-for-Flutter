import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
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
  final CacheDatabase _db;
  final _connectionEvents = StreamController<ConnectionEvent>();
  final _disconnectionEvents = StreamController<DisconnectionEvent>();
  final _integrations = BehaviorSubject<List<IntegrationModel>>();
  final _cacheKey = "integrations";

  IntegrationsManagerImpl._(
    this.baseRedirectUri,
    this._db,
    this._integrationClient,
  );

  static Future<IntegrationsManager> build(
    String baseRedirectUri,
    AuthProvider authProvider,
    IntegrationClient client, {
    CacheDatabase? database,
  }) async {
    final _database = database ?? await CacheDatabase.build();
    final manager = IntegrationsManagerImpl._(baseRedirectUri, _database, client);

    _database.integrations.streamIntegrations().listen((integrations) {
      manager._integrations.value = integrations.map((entity) => entity.toModel()).toList();
    });

    authProvider.authState.listen((authState) async {
      if (authState.isAuthenticated) {
        await manager.sync();
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
  Future<Uri?> getAuthorizeUri(String integrationIdentifier) async {
    final redirectUriString = await _integrationClient.getAuthorizeUri(integrationIdentifier, "${baseRedirectUri}main/profile");

    return redirectUriString != null ? Uri.parse(redirectUriString) : null;
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
    await _integrationClient.disconnect(integrationIdentifier);

    _disconnectionEvents.add(DisconnectionEvent(integrationIdentifier));
  }

  @override
  Future<void> sync() async {
    final cachedQuery = await _db.cachedQueries.get(_cacheKey);

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
          isLocal: i.isLocal,
          isConnected: i.isConnected,
          isEnabled: i.isEnabled,
          lastModifiedOn: null,
          eTag: null, // TODO; Add this properly
        );
      }).toList());

      await _db.cachedQueries.addOrReplace(CachedQueryEntity(
        key: _cacheKey,
        eTag: integrations.eTag,
        lastModifiedOn: integrations.lastModifiedOn?.toUtc(),
      ));

      if (kDebugMode) {
        final cachedQuery2 = await _db.cachedQueries.get(_cacheKey);
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
}

extension on IntegrationEntity {
  IntegrationModel toModel() {
    return IntegrationModel(
      identifier: identifier,
      displayName: displayName,
      logoUrl: logoUrl,
      isLocal: isLocal,
      isConnected: isConnected,
      isEnabled: isEnabled,
      lastModifiedOn: null, //lastModifiedOn
    );
  }
}
