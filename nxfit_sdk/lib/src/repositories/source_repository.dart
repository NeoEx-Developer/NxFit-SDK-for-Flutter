import '../models/source_model.dart';
import '../models/source_patch_model.dart';

abstract class SourceRepository {
  Stream<List<SourceModel>> list();
  Stream<SourceModel?> get(int id);

  /// Updates the supplied property for the given source [Id].
  Future<void> update(int sourceId, {int? priority, bool? isIncluded});
  Future<void> updateAll(List<SourcePatchModel> patches);
}
