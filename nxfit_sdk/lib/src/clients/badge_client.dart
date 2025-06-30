import '../models/badge_model.dart';
import '../persistence/cacheable_resource.dart';

/// Interface to the Badges resource
abstract class BadgeClient {
  /// Get the user's badges for a specified [date]. A [limit] may be set on the maximum number of badges to be returned.
  ///
  /// The [eTag] is used for change detection. Send the [eTag] returned by the most recent [CacheableResource], or NULL to always refresh the data.
  ///
  /// Returns a [List&lt;BadgeModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<BadgeModel>>> list({ DateTime? date, int? limit, String? eTag });
}
