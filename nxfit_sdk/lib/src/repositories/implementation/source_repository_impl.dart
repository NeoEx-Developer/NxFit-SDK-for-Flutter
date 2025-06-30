import 'package:meta/meta.dart';
import 'package:nxfit_sdk/src/cache/entities/cached_query_entity.dart';

import '../../../core.dart';
import '../../cache/cache_database.dart';
import '../../cache/cache_key_builder.dart';
import '../../cache/entities/source_entity.dart';
import '../../cache/persistent_cached_resource.dart';
import '../../clients/source_client.dart';
import '../../models/source_model.dart';
import '../../models/source_patch_model.dart';
import '../source_repository.dart';

@internal
class SourceRepositoryImpl implements SourceRepository {
  final PersistentCachedResource _cachedResource;
  final SourceClient _client;

  SourceRepositoryImpl(this._cachedResource, this._client);

  @override
  Stream<SourceModel?> get(int id) {
    return _cachedResource.getCachedItem(
      localLoader: (db) => db.sources.getSourceByIdStream(id),
      mapper: (entity) => entity?.asModel(),
      remoteLoader: (db, eTag, lastModifiedOn) => _fetchRemoteSource(db, id, ifModifiedSince: lastModifiedOn),
    );
  }

  @override
  Stream<List<SourceModel>> list() {
    return _cachedResource.getCachedList(
      CacheCategory.SourceList.value,
      localLoader: (db) => db.sources.listSourcesStream(),
      mapper: (entity) => entity.asModel(),
      remoteLoader: (db, eTag, lastModifiedOn) => _fetchRemoteSources(db, eTag: eTag),
    );
  }

  @override
  Future<void> update(int sourceId, {int? priority, bool? isIncluded}) async {
    _client.patch(
      sourceId,
      priority: priority,
      isIncluded: isIncluded,
    );

    _fetchRemoteSource(_cachedResource.db, sourceId);
  }

  @override
  Future<void> updateAll(List<SourcePatchModel> patches) async {
    await _client.patchAll(patches);

    _fetchRemoteSources(_cachedResource.db);
  }

  Future<void> _fetchRemoteSource(CacheDatabase db, int id, {DateTime? ifModifiedSince}) async {
    final sourceCacheable = await _client.get(id, ifModifiedSince: ifModifiedSince);
    final source = sourceCacheable.value;

    await db.sources.addOrReplaceSource(source.asEntity(lastModifiedOn: sourceCacheable.lastModifiedOn));
  }

  Future<Cacheable> _fetchRemoteSources(CacheDatabase db, {String? eTag}) async {
    final cacheableSources = await _client.list(eTag: eTag);
    final sources = cacheableSources.value.map((s) => s.asEntity(lastModifiedOn: cacheableSources.lastModifiedOn)).toList();

    // clear the existing sources and add the new ones
    db.sources.clear();
    db.sources.addOrReplaceSources(sources);
    await _cachedResource.db.cachedQueries.addOrReplace(CachedQueryEntity(
      key: CacheCategory.SourceList.value,
      eTag: cacheableSources.eTag,
      lastModifiedOn: cacheableSources.lastModifiedOn,
    ));

    return cacheableSources;
  }
}

extension _SourceEntityExtensions on SourceEntity {
  SourceModel asModel() => SourceModel(
        id,
        integrationIdentifier: integrationIdentifier,
        integrationDisplayName: integrationDisplayName,
        deviceName: deviceName,
        deviceHardwareVersion: deviceHardwareVersion,
        deviceManufacturer: deviceManufacturer,
        deviceOS: deviceOS,
        appName: appName,
        appIdentifier: appIdentifier,
        priority: priority,
        isIncluded: isIncluded,
        createdOn: createdOn,
        updatedOn: updatedOn,
      );
}

extension _SourceModelExtensions on SourceModel {
  SourceEntity asEntity({String? etTag, DateTime? lastModifiedOn}) => SourceEntity(id,
      integrationIdentifier: integrationIdentifier,
      integrationDisplayName: integrationDisplayName,
      deviceName: deviceName,
      deviceHardwareVersion: deviceHardwareVersion,
      deviceManufacturer: deviceManufacturer,
      deviceOS: deviceOS,
      appName: appName,
      appIdentifier: appIdentifier,
      priority: priority,
      isIncluded: isIncluded,
      createdOn: createdOn,
      updatedOn: updatedOn,
      eTag: etTag,
      lastModifiedOn: lastModifiedOn);
}
