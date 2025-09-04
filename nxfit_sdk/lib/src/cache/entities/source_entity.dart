import 'package:froom/froom.dart';

import 'cacheable_entity.dart';

@Entity(tableName: "source")
class SourceEntity implements CacheableEntity {
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: "id")
  final int id;

  @ColumnInfo(name: "integration_identifier")
  final String integrationIdentifier;

  @ColumnInfo(name: "integration_display_name")
  final String? integrationDisplayName;

  @ColumnInfo(name: "device_name")
  final String? deviceName;

  @ColumnInfo(name: "device_hardware_version")
  final String? deviceHardwareVersion;

  @ColumnInfo(name: "device_manufacturer")
  final String? deviceManufacturer;

  @ColumnInfo(name: "device_os")
  final String? deviceOS;

  @ColumnInfo(name: "app_name")
  final String? appName;

  @ColumnInfo(name: "app_identifier")
  final String? appIdentifier;

  @ColumnInfo(name: "priority")
  final int priority;

  @ColumnInfo(name: "is_included")
  final bool isIncluded;

  @ColumnInfo(name: "created_on")
  final DateTime createdOn;

  @ColumnInfo(name: "updated_on")
  final DateTime? updatedOn;

  @override
  @ColumnInfo(name: "last_modified_on")
  final DateTime? lastModifiedOn;

  @override
  @ColumnInfo(name: "etag")
  final String? eTag;

  SourceEntity(
    this.id, {
    required this.integrationIdentifier,
    required this.integrationDisplayName,
    this.deviceName,
    this.deviceHardwareVersion,
    this.deviceManufacturer,
    this.deviceOS,
    this.appName,
    this.appIdentifier,
    this.priority = 0,
    this.isIncluded = true,
    required this.createdOn,
    this.updatedOn,
    this.lastModifiedOn,
    this.eTag,
  });
}
