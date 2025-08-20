import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../api/api_caller.dart';
import '../../api/dtos/session/get_heart_rate_zone_summaries_response_dto.dart';
import '../../api/dtos/session/get_session_response_dto.dart' as GetSessionResponse;
import '../../api/dtos/session/get_sessions_response_dto.dart';
import '../../api/dtos/session/get_user_session_response_dto.dart' as GetUserSessionResponse;
import '../../api/dtos/session/get_user_sessions_response_dto.dart';
import '../../api/dtos/session/put_session_request_dto.dart';
import '../../api/extensions/http_response_extensions.dart';
import '../../api/helpers/quoted_string.dart';
import '../../api/protocols/session_protocol.dart';
import '../../auth/auth_provider.dart';
import '../../auth/auth_state.dart';
import '../../enums/activity_type.dart';
import '../../enums/session_privacy.dart';
import '../../enums/studio.dart';
import '../../models/heart_rate_zone_summaries_model.dart';
import '../../models/session_model.dart';
import '../../models/user_session_model.dart';
import '../../pagination/paged_list.dart';
import '../../pagination/pagination_request.dart';
import '../../persistence/cacheable_resource.dart';
import '../session_client.dart';

@internal
class SessionClientImpl extends SessionClient with ApiCaller {
  final SessionProtocol _protocol;
  final AuthProvider _authProvider;

  int get _userId => _authProvider.currentAuthState.userId ?? 0;

  SessionClientImpl(this._protocol, this._authProvider);

  @override
  Future<CacheableResource<UserSessionModel>> get(int id, {DateTime? ifModifiedSince, String? eTag}) async {
    final response = await apiCall(() async {
      return await _protocol.get(_userId, id, ifModifiedSince: ifModifiedSince, eTag: eTag?.toQuotedString());
    });

    return response.asCacheableResource((dto) => dto._asModel());
  }

  @override
  Future<CacheableResource<List<UserSessionModel>>> list({DateTime? from, DateTime? to, String? eTag}) async {
    final response = await apiCall(() async {
      return await _protocol.listForUser(_userId, from: from, to: to, eTag: eTag?.toQuotedString());
    });

    return response.asCacheableResource((dto) => dto._asModel());
  }

  @override
  Future<CacheableResource<HeartRateZoneSummariesModel>> listHeartRateZoneSummaries(int id, {DateTime? ifModifiedSince, String? eTag}) async {
    final response = await apiCall(() async {
      return await _protocol.listHeartRateZonesForSession(_userId, id, ifModifiedSince: ifModifiedSince, eTag: eTag?.toQuotedString());
    });

    return response.asCacheableResource((dto) => dto.asModel());
  }

  @override
  Future<CacheableResource<UserSessionModel>> getForUser(int userId, int id, {DateTime? ifModifiedSince, String? eTag}) async {
    final response = await apiCall(() async {
      return await _protocol.get(userId, id, ifModifiedSince: ifModifiedSince, eTag: eTag?.toQuotedString());
    });

    return response.asCacheableResource((dto) => dto._asModel());
  }

  @override
  Future<CacheableResource<PagedList<SessionModel>>> listForCohort(DateTime from, DateTime to, Studio studio, {String? etag, PaginationRequest? pagination}) async {
    final response = await apiCall(() async {
      return await _protocol.list(
        from: from,
        to: to,
        filterBy: studio.index,
        eTag: etag?.toQuotedString(),
        afterToken: pagination?.afterToken,
        beforeToken: pagination?.beforeToken,
        limit: pagination?.limit,
      );
    });

    return response.asCacheableResource((dto) => dto._asModel());
  }

  @override
  Future<CacheableResource<HeartRateZoneSummariesModel>> listHeartRateZoneSummariesForUser(int userId, int id, {DateTime? ifModifiedSince, String? eTag}) async {
    final response = await apiCall(() async {
      return await _protocol.listHeartRateZonesForSession(userId, id, ifModifiedSince: ifModifiedSince, eTag: eTag?.toQuotedString());
    });

    return response.asCacheableResource((dto) => dto.asModel());
  }

  @override
  Future<void> update(
    int id, {
    required ActivityType activityType,
    required OffsetDateTime startedOnLocal,
    required OffsetDateTime endedOnLocal,
    OffsetDateTime? completedOn,
    required int activeDurationInSeconds,
    String? syncId,
    String? syncVersion,
    required SessionPrivacy privacy,
  }) async {
    await apiCall(() async {
      await _protocol.put(
          _userId,
          id,
          PutSessionRequestDto(
            activityType: activityType.value,
            startedOnLocal: startedOnLocal,
            endedOnLocal: endedOnLocal,
            completedOn: completedOn,
            activeDurationInSeconds: activeDurationInSeconds,
            syncId: syncId,
            syncVersion: syncVersion,
            privacy: privacy.name,
          ));
    });
  }
}

@internal
extension GetUserSessionResponseDtoExtensions on GetUserSessionResponse.GetUserSessionResponseDto {
  UserSessionModel _asModel() {
    return UserSessionModel(id,
        activityType: ActivityType.of(activityType),
        activeDuration: Duration(seconds: activeDurationInSeconds),
        energyBurnedInCalories: energyBurnedInCalories,
        maximalOxygenConsumption: maximalOxygenConsumption,
        sourceIntegration: source.integration,
        sourceDevice: source.device,
        sourceApp: source.app,
        syncId: syncDetails?.id,
        syncVersion: syncDetails?.version,
        startedOnLocal: startedOnLocal,
        endedOnLocal: endedOnLocal,
        createdOn: metadata.createdOn,
        updatedOn: metadata.updatedOn,
        user: UserDetails(user.id, user.name, user.imageUrl),
        source: SourceDetails(source.integration, source.device, source.app),
        heartRateMetrics: heartRateMetrics != null ? HeartRateMetrics(heartRateMetrics!.avgBPM, heartRateMetrics!.maxBPM, heartRateMetrics!.minBPM) : null,
        speedMetrics: speedMetrics != null ? SpeedMetrics(speedMetrics!.avgSpeedInMetersPerSecond, speedMetrics!.maxSpeedInMetersPerSecond, speedMetrics!.minSpeedInMetersPerSecond) : null,
        cadenceMetrics: cadenceMetrics != null ? CadenceMetrics(cadenceMetrics!.avgCadencePerMinute, cadenceMetrics!.maxCadencePerMinute, cadenceMetrics!.minCadencePerMinute, cadenceMetrics!.cadenceUnitShort, cadenceMetrics!.cadenceUnitFull) : null,
        powerMetrics: powerMetrics != null ? PowerMetrics(powerMetrics!.avgPowerInWatts, powerMetrics!.maxPowerInWatts, powerMetrics!.minPowerInWatts) : null,
        metadata: Metadata(completedOn: metadata.completedOn, privacy: SessionPrivacy.of(metadata.privacy)));
  }
}

@internal
extension GetUserSessionsResponseDtoExtensions on GetUserSessionsResponseDto {
  List<UserSessionModel> _asModel() {
    return sessions.map((session) => session._asModel()).toList();
  }
}

@internal
extension GetSessionResponseDtoExtensions on GetSessionResponse.GetSessionResponseDto {
  SessionModel _asModel() {
    return SessionModel(id,
        activityType: ActivityType.of(activityType),
        activeDuration: Duration(seconds: activeDurationInSeconds),
        energyBurnedInCalories: energyBurnedInCalories,
        maximalOxygenConsumption: maximalOxygenConsumption,
        startedOnLocal: startedOnLocal,
        endedOnLocal: endedOnLocal,
        createdOn: metadata.createdOn,
        updatedOn: metadata.updatedOn,
        user: UserDetails(user.id, user.name, user.imageUrl),
        heartRateMetrics: heartRateMetrics != null ? HeartRateMetrics(heartRateMetrics!.avgBPM, heartRateMetrics!.maxBPM, heartRateMetrics!.minBPM) : null,
        speedMetrics: speedMetrics != null ? SpeedMetrics(speedMetrics!.avgSpeedInMetersPerSecond, speedMetrics!.maxSpeedInMetersPerSecond, speedMetrics!.minSpeedInMetersPerSecond) : null,
        cadenceMetrics: cadenceMetrics != null ? CadenceMetrics(cadenceMetrics!.avgCadencePerMinute, cadenceMetrics!.maxCadencePerMinute, cadenceMetrics!.minCadencePerMinute, cadenceMetrics!.cadenceUnitShort, cadenceMetrics!.cadenceUnitFull) : null,
        powerMetrics: powerMetrics != null ? PowerMetrics(powerMetrics!.avgPowerInWatts, powerMetrics!.maxPowerInWatts, powerMetrics!.minPowerInWatts) : null);
  }
}

@internal
extension GetSessionsResponseDtoExtensions on GetSessionsResponseDto {
  PagedList<SessionModel> _asModel() {
    return PagedList.withLinks(
      sessions.map((session) => session._asModel()).toList(),
      links ?? <String, String>{},
    );
  }
}

@internal
extension GetHeartRateZoneSummariesResponseDtoExtensions on GetHeartRateZoneSummariesResponseDto {
  HeartRateZoneSummariesModel asModel() {
    return HeartRateZoneSummariesModel(heartRateZones
        .map((model) => HeartRateZoneSummaryModel(
              model.zone,
              model.minBPM,
              model.maxBPM,
              Duration(seconds: model.durationInSeconds),
            ))
        .toList());
  }
}
