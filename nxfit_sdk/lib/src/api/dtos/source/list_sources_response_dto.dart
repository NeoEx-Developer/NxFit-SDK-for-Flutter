import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../converters/offsetdatetime_json_converter.dart';

part 'list_sources_response_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
class ListSourcesResponseDto {
  @JsonKey(name: 'results')
  final List<ListSourcesResponseDto_Source> sources;

  const ListSourcesResponseDto({required this.sources});

  factory ListSourcesResponseDto.fromJson(Map<String, dynamic> json) => _$ListSourcesResponseDtoFromJson(json);
}

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class ListSourcesResponseDto_Source {
  final int id;
  final String integrationIdentifier;
  final String? integrationDisplayName;
  final String? deviceName;
  final String? deviceHardwareVersion;
  final String? deviceManufacturer;
  final String? deviceOS;
  final String? appName;
  final String? appIdentifier;
  final int priority;
  @JsonKey(name: 'include')
  final bool isIncluded;
  final OffsetDateTime createdOn;
  final OffsetDateTime updatedOn;

  const ListSourcesResponseDto_Source({
    required this.id,
    required this.integrationIdentifier,
    required this.integrationDisplayName,
    this.deviceName,
    this.deviceHardwareVersion,
    this.deviceManufacturer,
    this.deviceOS,
    this.appName,
    this.appIdentifier,
    required this.priority,
    required this.isIncluded,
    required this.createdOn,
    required this.updatedOn,
  });

  factory ListSourcesResponseDto_Source.fromJson(Map<String, dynamic> json) => _$ListSourcesResponseDto_SourceFromJson(json);
}
