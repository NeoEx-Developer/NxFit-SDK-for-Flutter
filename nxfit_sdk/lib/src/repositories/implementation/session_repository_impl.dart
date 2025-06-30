import 'package:meta/meta.dart';

import '../../cache/persistent_cached_resource.dart';
import '../../clients/session_client.dart';
import '../../enums/studio.dart';
import '../../models/heart_rate_zone_summaries_model.dart';
import '../../models/session_model.dart';
import '../../models/user_session_model.dart';
import '../../pagination/paged_list.dart';
import '../../pagination/pagination_request.dart';
import '../session_repository.dart';

@internal
class SessionRepositoryImpl extends SessionRepository {
  final PersistentCachedResource _cachedResource;
  final SessionClient _client;

  SessionRepositoryImpl(this._cachedResource, this._client);

  @override
  Stream<UserSessionModel> get(int id) {
    return _client.get(id)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<UserSessionModel> getForUser(int userId, int id) {
    return _client.getForUser(userId, id)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<UserSessionModel>> list({DateTime? from, DateTime? to}) {
    return _client.list(from: from, to: to)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<PagedList<SessionModel>> listForCohort(DateTime from, DateTime to, Studio studio, {PaginationRequest? pagination}) {
    return _client.listForCohort(from, to, studio, pagination: pagination)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<HeartRateZoneSummariesModel> listHeartRateZoneSummaries(int id) {
    return _client.listHeartRateZoneSummaries(id)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<HeartRateZoneSummariesModel> listHeartRateZoneSummariesForUser(int userId, int id) {
    return _client.listHeartRateZoneSummariesForUser(userId, id)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }
}
