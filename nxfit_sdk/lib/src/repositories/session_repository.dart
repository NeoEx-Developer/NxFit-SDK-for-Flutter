import '../enums/studio.dart';
import '../models/heart_rate_zone_summaries_model.dart';
import '../models/session_model.dart';
import '../models/user_session_model.dart';
import '../pagination/paged_list.dart';
import '../pagination/pagination_request.dart';

abstract class SessionRepository {
  Stream<UserSessionModel> get(int id);
  Stream<List<UserSessionModel>> list({ DateTime? from, DateTime? to });
  Stream<HeartRateZoneSummariesModel> listHeartRateZoneSummaries(int id);
  Stream<UserSessionModel> getForUser(int userId, int id);
  Stream<PagedList<SessionModel>> listForCohort(DateTime from, DateTime to, Studio studio, {PaginationRequest? pagination});
  Stream<HeartRateZoneSummariesModel> listHeartRateZoneSummariesForUser(int userId, int id);
}