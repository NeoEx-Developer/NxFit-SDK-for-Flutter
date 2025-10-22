// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_source_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSourceResponseDto _$GetSourceResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetSourceResponseDto(
  id: (json['id'] as num).toInt(),
  integrationIdentifier: json['integrationIdentifier'] as String,
  integrationDisplayName: json['integrationDisplayName'] as String,
  deviceName: json['deviceName'] as String?,
  deviceHardwareVersion: json['deviceHardwareVersion'] as String?,
  deviceManufacturer: json['deviceManufacturer'] as String?,
  deviceOS: json['deviceOS'] as String?,
  appName: json['appName'] as String?,
  appIdentifier: json['appIdentifier'] as String?,
  priority: (json['priority'] as num).toInt(),
  isIncluded: json['include'] as bool,
  createdOn: const OffsetDateTimeJsonConverter().fromJson(
    json['createdOn'] as String,
  ),
  updatedOn: const OffsetDateTimeJsonConverter().fromJson(
    json['updatedOn'] as String,
  ),
);
