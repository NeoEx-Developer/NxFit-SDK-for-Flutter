import 'package:meta/meta.dart';

import '../../cache/persistent_cached_resource.dart';
import '../../clients/badge_client.dart';
import '../../models/badge_model.dart';
import '../badge_repository.dart';

@internal
class BadgeRepositoryImpl extends BadgeRepository {
  final PersistentCachedResource _cachedResource;
  final BadgeClient _client;

  BadgeRepositoryImpl(this._cachedResource, this._client);

  @override
  Stream<List<BadgeModel>> list({ DateTime? date, int? limit }) {
    return _client.list(date: date, limit: limit)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }
}
