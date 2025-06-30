import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart'; // Import for OffsetDateTime
import 'package:json_annotation/json_annotation.dart';

import '../../converters/offsetdatetime_json_converter.dart';

part 'get_source_response_dto.g.dart'; // Part file for generated code

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class GetSourceResponseDto {
  final int id;
  final String integrationIdentifier;
  final String integrationDisplayName;
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

  const GetSourceResponseDto({
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

  factory GetSourceResponseDto.fromJson(Map<String, dynamic> json) => _$GetSourceResponseDtoFromJson(json);
}
