import 'package:froom/froom.dart';

import 'cacheable_entity.dart';

@Entity(tableName: "cached_query")
class CachedQueryEntity implements CacheableEntity {
  @primaryKey
  final String key;

  @override
  final DateTime? lastModifiedOn;

  @override
  final String? eTag;

  CachedQueryEntity({
    required this.key,
    this.lastModifiedOn,
    this.eTag,
  });
}
