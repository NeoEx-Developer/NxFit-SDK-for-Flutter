import 'package:floor/floor.dart';

import 'cacheable_entity.dart';

@Entity(tableName: "integration")
class IntegrationEntity implements CacheableEntity {
  @primaryKey
  final String identifier;

  @ColumnInfo(name: "display_name")
  final String displayName;

  @ColumnInfo(name: "logo_url")
  final String logoUrl;

  @ColumnInfo(name: "is_local")
  final bool isLocal;

  @ColumnInfo(name: "is_connected")
  final bool isConnected;

  @ColumnInfo(name: "is_enabled")
  final bool isEnabled;

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
    required this.isLocal,
    required this.isConnected,
    required this.isEnabled,
    this.lastModifiedOn,
    this.eTag,
  });
}
