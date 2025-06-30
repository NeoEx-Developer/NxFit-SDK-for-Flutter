
import '../models/badge_model.dart';

/// The [BadgeRepository] wraps the [BadgeClient] to provide caching.
abstract class BadgeRepository {
  Stream<List<BadgeModel>> list({ DateTime? date, int? limit });
}