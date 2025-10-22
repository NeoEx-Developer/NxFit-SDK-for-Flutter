// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_sources_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSourcesResponseDto _$ListSourcesResponseDtoFromJson(
  Map<String, dynamic> json,
) => ListSourcesResponseDto(
  sources: (json['results'] as List<dynamic>)
      .map(
        (e) =>
            ListSourcesResponseDto_Source.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

ListSourcesResponseDto_Source _$ListSourcesResponseDto_SourceFromJson(
  Map<String, dynamic> json,
) => ListSourcesResponseDto_Source(
  id: (json['id'] as num).toInt(),
  integrationIdentifier: json['integrationIdentifier'] as String,
  integrationDisplayName: json['integrationDisplayName'] as String?,
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
