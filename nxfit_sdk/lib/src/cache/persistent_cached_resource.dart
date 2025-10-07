import '../extensions/stream_extensions.dart';
import '../logging/nxfit_logger.dart';
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

  /// Gets a cached item from the local database and attempts to refresh it from the remote source.
  /// If the item is not found in the local database, it will still attempt to load it from the remote source.
  /// If a network exception occurs during the remote load, the [onExceptionHandler] will be called if provided.
  Stream<TModel> getCachedItem<TEntity extends CacheableEntity?, TModel>({
    required LocalItemLoader<TEntity> localLoader, // Function to load the item from the local database
    required EntityToModelMapper<TEntity, TModel> mapper,
    required RemoteItemLoader remoteLoader,
    OnNetworkExceptionHandler? onExceptionHandler,
  }) {
    return localLoader(db)
        .onFirst((entity) async {
          try {
            final eTag = entity?.eTag;
            final lastModifiedOn = entity?.lastModifiedOn;

            logger.fine("!!! getCachedItem: ETag: $eTag  LastModifiedOn: $lastModifiedOn Entity: ${entity.toString()}");

            await remoteLoader(db, eTag, lastModifiedOn); //entity?.eTag, entity?.lastModifiedOn);
          } on Exception catch (e) {
            onExceptionHandler?.call(e);
          }
        })
        //        .where((entity) => entity != null)
        .map((entity) => mapper(entity));
  }

  /// Gets a cached list from the local database and attempts to refresh it from the remote source.
  /// If a network exception occurs during the remote load, the [onExceptionHandler] will be called if provided.
  /// The [key] is used to identify the cached query for storing ETag and Last-Modified information.
  /// If the local loader returns an empty list, it will still attempt to load from the remote source.
  Stream<List<TModel>> getCachedList<TEntity, TModel>(
    final String key, { // Unique key for the cached query
    required LocalListLoader<TEntity> localLoader,
    required EntityToModelMapper<TEntity, TModel> mapper,
    required RemoteListLoader remoteLoader,
    OnNetworkExceptionHandler? onExceptionHandler,
  }) {
    return localLoader(db)
        .onFirst((x) async {
          try {
            final cachedQuery = await db.cachedQueries.get(key);
            final cacheable = await remoteLoader(db, cachedQuery?.eTag, cachedQuery?.lastModifiedOn);

            await db.cachedQueries.addOrReplace(CachedQueryEntity(key: key, lastModifiedOn: cacheable.lastModifiedOn, eTag: cacheable.eTag));
          } on Exception catch (e) {
            logger.fine("Failed to fetch for key: $key.", e);
            onExceptionHandler?.call(e);
          }
        })
        .handleError((error) {
          logger.severe("getCachedList($key) failed.", error);
        })
        .map((entities) => entities.map((e) => mapper(e)).toList());
  }
}
