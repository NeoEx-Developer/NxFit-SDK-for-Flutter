import 'package:froom/froom.dart';

import '../../logging/nxfit_logger.dart';
import '../entities/source_entity.dart';

@dao
abstract class SourceDao {
  @Query("SELECT * FROM source")
  Future<List<SourceEntity>> listSources();

  @Query("SELECT * FROM source")
  Stream<List<SourceEntity>> listSourcesStream();

  @Query("SELECT * FROM source WHERE id = :id")
  Future<SourceEntity?> getSourceById(int id);

  @Query("SELECT * FROM source WHERE id = :id")
  Stream<SourceEntity?> getSourceByIdStream(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> addOrReplaceSource(SourceEntity source);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addOrReplaceSources(List<SourceEntity> sources);

  @Update()
  Future<int> updateSource(SourceEntity source);

  @Query("DELETE FROM source WHERE id = :id")
  Future<void> deleteSource(int id);

  @Query("DELETE FROM source")
  Future<void> clear();
}

extension SourceDaoExtensions on SourceDao {
  @transaction
  Future<void> addOrReplaceSources(Iterable<SourceEntity> sources) async {
    for (final source in sources) {
      await addOrReplaceSource(source);
    }
  }

  @transaction
  Future<void> updateSources(Iterable<SourceEntity> sources) async {
    var updated = 0;

    for (final source in sources) {
      updated += await updateSource(source);
    }

    logger.info("Sources updated: $updated");
  }

  @transaction
  Future<void> deleteSources(Iterable<SourceEntity> sources) async {
    for (final source in sources) {
      await deleteSource(source.id);
    }
  }
}