import 'package:meta/meta.dart';

import '../../cache/persistent_cached_resource.dart';
import '../../clients/session_summary_client.dart';
import '../../models/heart_rate_zone_summaries_model.dart';
import '../../models/session_metrics_model.dart';
import '../session_summary_repository.dart';

@internal
class SessionSummaryRepositoryImpl extends SessionSummaryRepository {
  final PersistentCachedResource _cachedResource;
  final SessionSummaryClient _client;

  SessionSummaryRepositoryImpl(this._cachedResource, this._client);

  @override
  Stream<HeartRateZoneSummariesModel> getHeartRateZones({DateTime? from, DateTime? to}) {
    return _client.getHeartRateZones(from: from, to: to)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<SessionMetricsModel> getMetrics({DateTime? from, DateTime? to}) {
    return _client.getMetrics(from: from, to: to)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }
}
