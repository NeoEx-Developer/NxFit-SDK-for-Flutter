import 'package:time_machine/time_machine.dart';

import '../enums/activity_type.dart';
import '../enums/session_privacy.dart';
import '../enums/studio.dart';
import '../models/heart_rate_zone_summaries_model.dart';
import '../models/session_model.dart';
import '../models/user_session_model.dart';
import '../pagination/paged_list.dart';
import '../pagination/pagination_request.dart';
import '../persistence/cacheable_resource.dart';

/// Interface to the Session resource.
abstract class SessionClient {
  /// Gets a session with the given [id]. It accepts both [ifModifiedSince] and [etag]. If both are provided it will favour [ifModifiedSince].
  ///
  /// Returns a [UserSessionModel] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<UserSessionModel>> get(int id, {DateTime? ifModifiedSince, String? eTag});

  /// Retrieve a list of sessions with a start date between the **from** and **to** dates, inclusive. The maximum difference between the **from**
  /// and **to** dates is 31 days.
  ///
  /// If no [from] date is specified the start of the current day is used. The [from] value MUST be lesser than the [to] parameter. If no [to] date is
  /// specified the end of the current day is used. The [to] value MUST be greater than the [from] parameter.
  ///
  /// [eTag] is Used for change detection. A **NULL** [eTag] will always fetch the current resource. In subsequent calls set this to the value of the
  /// [eTag] property of the [CacheableResource].
  ///
  /// Returns a [UserSessionModel] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException]
  Future<CacheableResource<List<UserSessionModel>>> list({DateTime? from, DateTime? to, String? eTag});

  /// Retrieve the list of heart rate zone summaries for a given session [id].
  ///
  /// [ifModifiedSince] and [eTag] are used for change detection. In subsequent calls set either the [ifModifiedSince] or [eTag] to the associated property of the [CacheableResource].
  ///
  /// Returns a [HeartRateZoneSummariesModel] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<HeartRateZoneSummariesModel>> listHeartRateZoneSummaries(int id, {DateTime? ifModifiedSince, String? eTag});

  /// Get the public version of a session for the given ID. This is a helper method for some of the other overloads to assist with the cache control parameters. It accepts both
  //  ifModifiedSince and eTag. If both are provided it will favour ifModifiedSince.
  ///
  /// @param id The unique session identifier
  /// @param ifModifiedSince Used for change detection. In subsequent calls set this to the value of the lastModifiedOn property of the CacheableResource.
  /// @param eTag Used for change detection. In subsequent calls set this to the value of the eTag property of the CacheableResource.
  /// @return A [UserSessionModel] as a [CacheableResource]
  /// @throws NotModifiedException
  Future<CacheableResource<UserSessionModel>> getForUser(int userId, int id, {DateTime? ifModifiedSince, String? eTag});

  /// Retrieve a list of sessions with a start date between the *from* and *to* dates, inclusive. The maximum difference between the *from* and *to* dates is 31 days.
  ///
  /// @param from Include sessions that have started on or after this date. If not specified the start of the current day is used. This value MUST be lesser than the *to* parameter.
  /// @param to Include sessions that have started on or before this date. If not specified the end of the current day is used. This value MUST be greater than the *from* parameter.
  /// @param eTag Used for change detection. A **NULL** eTag will always fetch the current resource. In subsequent calls set this to the value of the eTag property of the CacheableResource.
  /// @return A [SessionModel] as a [CacheableResource]
  /// @throws NotModifiedException
  Future<CacheableResource<PagedList<SessionModel>>> listForCohort(DateTime from, DateTime to, Studio studio, {String? etag, PaginationRequest? pagination});

  /// Retrieve the list of heart rate zone summaries associated with a specific session.
  ///
  /// @param id The session id
  /// @param ifModifiedSince Used for change detection. In subsequent calls set this to the value of the lastModifiedOn property of the CacheableResource.
  /// @param eTag Used for change detection. In subsequent calls set this to the value of the eTag property of the CacheableResource.
  /// @return A [HeartRateZoneSummariesModel] as a [CacheableResource]
  /// @throws NotModifiedException
  Future<CacheableResource<HeartRateZoneSummariesModel>> listHeartRateZoneSummariesForUser(int userId, int id, {DateTime? ifModifiedSince, String? eTag});

  /// Updates a session based on it's ID. All parameters will be updated, even if they are null.
  Future<void> update(
    int id, {
    required String activityId,
    required ActivityType activityType,
    required OffsetDateTime startedOnLocal,
    required OffsetDateTime endedOnLocal,
    OffsetDateTime? completedOn,
    required int activeDurationInSeconds,
    String? syncId,
    String? syncVersion,
    required SessionPrivacy privacy,
  });
}
