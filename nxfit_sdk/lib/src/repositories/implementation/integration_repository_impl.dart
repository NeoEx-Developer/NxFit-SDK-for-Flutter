import 'package:floor/floor.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../cache/cache_database.dart';
import '../../cache/cache_key_builder.dart';
import '../../cache/entities/integration_entity.dart';
import '../../cache/persistent_cached_resource.dart';
import '../../clients/integration_client.dart';
import '../../extensions/iterable_extensions.dart';
import '../../models/integration_model.dart';
import '../../persistence/cacheable.dart';
import '../integration_repository.dart';

@internal
class IntegrationRepositoryImpl extends IntegrationRepository {
  final PersistentCachedResource _cachedResource;
  final IntegrationClient _client;

  IntegrationRepositoryImpl(this._cachedResource, this._client);

  @override
  Stream<List<IntegrationModel>> listIntegrations() {
    return _cachedResource.getCachedList(
      CacheCategory.IntegrationList.value,
      localLoader: (db) => db.integrations.streamIntegrations(),
      mapper: (e) => IntegrationModel(
        identifier: e.identifier,
        displayName: e.displayName,
        logoUrl: e.logoUrl,
        isLocal: e.isLocal,
        isConnected: e.isConnected,
        isEnabled: e.isEnabled,
        lastModifiedOn: (e.lastModifiedOn != null) ? OffsetDateTime(LocalDateTime.dateTime(e.lastModifiedOn!), Offset()) : null,
      ),
      remoteLoader: (db, eTag, lastModifiedOn) => _fetchRemoteIntegrations(db, eTag, lastModifiedOn),
    );
  }

  Future<Cacheable> _fetchRemoteIntegrations(CacheDatabase db, String? etag, DateTime? lastModifiedOn) async {
    final cacheableIntegrations = await _client.listIntegrations(eTag: etag);
    final integrations = cacheableIntegrations.value
        .map((i) => IntegrationEntity(
              identifier: i.identifier,
              displayName: i.displayName,
              logoUrl: i.logoUrl,
              isLocal: i.isLocal,
              isConnected: i.isConnected,
              isEnabled: i.isEnabled,
              lastModifiedOn: i.lastModifiedOn?.localDateTime.toDateTimeLocal()
            ))
        .toList();

    await _saveIntegrations(db, integrations);

    return cacheableIntegrations;
  }

  @transaction
  Future<void> _saveIntegrations(CacheDatabase db, List<IntegrationEntity> integrations) async {
    await integrations.tapAsync((i) async => await db.integrations.addOrReplaceIntegration(i));
  }
}
