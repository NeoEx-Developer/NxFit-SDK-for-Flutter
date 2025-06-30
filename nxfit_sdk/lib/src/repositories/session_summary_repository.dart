import '../models/heart_rate_zone_summaries_model.dart';
import '../models/session_metrics_model.dart';

abstract class SessionSummaryRepository {

  /// Retrieve a summary of sessions that were started between the *from* and *to* dates. The maximum difference between the *from* and *to* dates is 31 days.
  ///
  /// @param from Include sessions that have started on or after this date. If not specified the start of the current day is used. This value MUST be lesser than the *to* parameter.
  /// @param to Include sessions that have started on or before this date. If not specified the end of the current day is used. This value MUST be greater than the *from* parameter.
  /// @return A [SessionMetricsModel]
  Stream<SessionMetricsModel> getMetrics({ DateTime? from, DateTime? to });

  /// Retrieve a heart rate zone summary for sessions that were started between the *from* and *to* dates. The maximum difference between the *from* and *to* dates is 31 days.
  ///
  /// @param from Include sessions that have started on or after this date. If not specified the start of the current day is used. This value MUST be lesser than the *to* parameter.
  /// @param to Include sessions that have started on or before this date. If not specified the end of the current day is used. This value MUST be greater than the *from* parameter.
  /// @return A [HeartRateZoneSummariesModel]
  Stream<HeartRateZoneSummariesModel> getHeartRateZones({ DateTime? from, DateTime? to });
}
