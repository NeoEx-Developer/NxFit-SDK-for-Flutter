import 'package:meta/meta.dart';

import '../../api/api_caller.dart';
import '../../api/dtos/summary/get_heart_rate_zone_summaries_response_dto.dart';
import '../../api/dtos/summary/get_session_metrics_response_dto.dart';
import '../../api/extensions/http_response_extensions.dart';
import '../../api/helpers/quoted_string.dart';
import '../../api/protocols/session_summary_protocol.dart';
import '../../auth/auth_provider.dart';
import '../../auth/auth_state.dart';
import '../../models/heart_rate_zone_summaries_model.dart';
import '../../models/session_metrics_model.dart';
import '../../persistence/cacheable_resource.dart';
import '../session_summary_client.dart';

@internal
class SessionSummaryClientImpl extends SessionSummaryClient with ApiCaller {
  final SessionSummaryProtocol _protocol;
  final AuthProvider _authProvider;

  int get _userId => _authProvider.currentAuthState.userId ?? 0;

  SessionSummaryClientImpl(this._protocol, this._authProvider);

  @override
  Future<CacheableResource<SessionMetricsModel>> getMetrics({DateTime? from, DateTime? to, String? eTag}) async {
    final response = await apiCall(() async {
      return await _protocol.get(_userId, from, to, eTag: eTag?.toQuotedString());
    });

    return response.asCacheableResource((dto) => dto.asModel());
  }

  @override
  Future<CacheableResource<HeartRateZoneSummariesModel>> getHeartRateZones({DateTime? from, DateTime? to, String? eTag}) async {
    final response = await apiCall(() async {
      return await _protocol.listHeartRateZones(_userId, from, to, eTag: eTag?.toQuotedString());
    });

    return response.asCacheableResource((dto) => dto.asModel());
  }
}

////////////////////////
// asModel() extensions

@internal
extension GetSessionMetricsResponseDtoExtensions on GetSessionMetricsResponseDto {
  SessionMetricsModel asModel() {
    return SessionMetricsModel(
        activityCount: this.activityCount,
        avgBPM: this.avgBPM,
        maxBPM: this.maxBPM,
        minBPM: this.minBPM,
        energyBurnedInCalories: this.energyBurnedInCalories,
        activeTimeInSeconds: this.activeTimeInSeconds,
        activeTimeGoalInSeconds: this.activeTimeGoalInSeconds
    );
  }
}

@internal
extension GetHeartRateZoneSummariesResponseDtoExtensions on GetHeartRateZoneSummariesResponseDto {
  HeartRateZoneSummariesModel asModel() {
    return HeartRateZoneSummariesModel(heartRateZoneSummaries
        .map((summary) => HeartRateZoneSummaryModel(
              summary.zone,
              summary.minBPM,
              summary.maxBPM,
              Duration(seconds: summary.durationInSeconds),
            ))
        .toList());
  }
}
