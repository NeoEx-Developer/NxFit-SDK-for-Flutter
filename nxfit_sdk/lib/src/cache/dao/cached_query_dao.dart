import 'package:froom/froom.dart';

import '../entities/cached_query_entity.dart';

@dao
abstract class CachedQueryDao {
  @Query("SELECT * FROM cached_query WHERE [key] = :key")
  Future<CachedQueryEntity?> get(String key);

  @Query("SELECT * FROM cached_query")
  Future<List<CachedQueryEntity>> getAll();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addOrReplace(CachedQueryEntity entity);

  @Query("DELETE FROM cached_query WHERE [key] = :key")
  Future<void> remove(String key);
}
