import '../models/heart_rate_zone_summaries_model.dart';
import '../models/session_metrics_model.dart';
import '../persistence/cacheable_resource.dart';

abstract class SessionSummaryClient {
  /// Retrieve a summary of sessions that were started between the [from] and [to] dates. The maximum difference between the *from* and *to* dates is 31 days.
  ///
  /// The [eTag] is used for change detection. Send the latest [eTag] returned by the [CacheableResource], or NULL to always refresh the data.
  ///
  /// Returns a [SessionMetricsModel] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<SessionMetricsModel>> getMetrics({ DateTime? from, DateTime? to, String? eTag });

  /// Retrieve a heart rate zone summary for sessions that were started between the *from* and *to* dates. The maximum difference between the *from* and *to* dates is 31 days.
  ///
  /// The [eTag] is used for change detection. Send the latest [eTag] returned by the [CacheableResource], or NULL to always refresh the data.
  ///
  /// Returns a [HeartRateZoneSummariesModel] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<HeartRateZoneSummariesModel>> getHeartRateZones({ DateTime? from, DateTime? to, String? eTag });
}
