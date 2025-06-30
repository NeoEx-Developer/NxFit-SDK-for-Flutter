import 'package:flutter/foundation.dart';

import '../extensions/stream_extensions.dart';
import '../persistence/cacheable.dart';
import 'cache_database.dart';
import 'entities/cacheable_entity.dart';
import 'entities/cached_query_entity.dart';

typedef LocalItemLoader<TEntity> = Stream<TEntity> Function(CacheDatabase);
typedef LocalListLoader<TEntity> = Stream<List<TEntity>> Function(CacheDatabase);
typedef EntityToModelMapper<TEntity, TModel> = TModel Function(TEntity);
typedef RemoteItemLoader = Future<void> Function(CacheDatabase db, String? eTag, DateTime? lastModifiedOn);
typedef RemoteListLoader = Future<Cacheable> Function(CacheDatabase db, String? eTag, DateTime? lastModifiedOn);
typedef OnNetworkExceptionHandler = Function(Exception);

class PersistentCachedResource {
  final CacheDatabase db;

  PersistentCachedResource(this.db);

  Stream<TModel> getCachedItem<TEntity extends CacheableEntity?, TModel>({
    required LocalItemLoader<TEntity> localLoader,
    required EntityToModelMapper<TEntity, TModel> mapper,
    required RemoteItemLoader remoteLoader,
    OnNetworkExceptionHandler? onExceptionHandler,
  }) {
    return localLoader(db).onFirst((entity) async {
      try {
        final eTag = entity?.eTag;
        final lastModifiedOn = entity?.lastModifiedOn;

        if (kDebugMode) {
          print("!!! getCachedItem: ETag: $eTag  LastModifiedOn: $lastModifiedOn Entity: ${entity.toString()}");
        }

        await remoteLoader(db, eTag, lastModifiedOn); //entity?.eTag, entity?.lastModifiedOn);
      } on Exception catch (e) {
        onExceptionHandler?.call(e);
      }
    })
//        .where((entity) => entity != null)
        .map((entity) => mapper(entity));
  }

  Stream<List<TModel>> getCachedList<TEntity, TModel>(
    final String key, {
    required LocalListLoader<TEntity> localLoader,
    required EntityToModelMapper<TEntity, TModel> mapper,
    required RemoteListLoader remoteLoader,
    OnNetworkExceptionHandler? onExceptionHandler,
  }) {
    return localLoader(db).onFirst((x) async {
      try {
        final cachedQuery = await db.cachedQueries.get(key);
        final cacheable = await remoteLoader(db, cachedQuery?.eTag, cachedQuery?.lastModifiedOn);

        await db.cachedQueries.addOrReplace(CachedQueryEntity(
          key: key,
          lastModifiedOn: cacheable.lastModifiedOn,
          eTag: cacheable.eTag,
        ));
      } on Exception catch (e) {
        print("Network ERROR>> ${e}");
        onExceptionHandler?.call(e);
      }
    }).handleError((error) {
      print("ERROR: ${error}");
    }).map((entities) => entities.map((e) => mapper(e)).toList());
  }
}
