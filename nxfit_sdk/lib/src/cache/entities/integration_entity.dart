import 'package:froom/froom.dart';

import 'cacheable_entity.dart';

@Entity(tableName: "integration")
class IntegrationEntity implements CacheableEntity {
  @primaryKey
  final String identifier;

  @ColumnInfo(name: "display_name")
  final String displayName;

  @ColumnInfo(name: "logo_url")
  final String logoUrl;

  @ColumnInfo(name: "is_connected")
  final bool isConnected;

  @override
  @ColumnInfo(name: "last_modified_on")
  final DateTime? lastModifiedOn;

  @override
  @ColumnInfo(name: "etag")
  final String? eTag;

  IntegrationEntity({
    required this.identifier,
    required this.displayName,
    required this.logoUrl,
    required this.isConnected,
    this.lastModifiedOn,
    this.eTag,
  });
}
