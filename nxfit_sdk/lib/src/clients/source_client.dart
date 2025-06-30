import '../models/source_model.dart';
import '../models/source_patch_model.dart';
import '../persistence/cacheable_resource.dart';

abstract class SourceClient {
  /// Fetches all sources.
  ///
  /// The [eTag] is used for change detection. Send the [eTag] returned by the most recent [CacheableResource], or NULL to always refresh the data.
  ///
  /// Returns a [List&lt;SourceModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<SourceModel>>> list({String? eTag});

  /// Fetches the source for the given [id].
  ///
  /// The [ifModifiedSince] is used for change detection. Send the [ifModifiedSince] returned by the most recent [CacheableResource], or NULL to always refresh the data.
  ///
  /// Returns a [SourceModel] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<SourceModel>> get(int id, {DateTime? ifModifiedSince, String? eTag});

  /// Patches the given [source] with the given [id]. Note that sources are created when activities are created so only the [priority]
  /// and [isIncluded] fields are updatable. Passing a null value for any of the fields will **not** update them.
  Future<void> patch(
    int id, {
    int? priority,
    bool? isIncluded,
  });

  /// Patches all sources with the given [patches].
  Future<void> patchAll(List<SourcePatchModel> patches);
}
