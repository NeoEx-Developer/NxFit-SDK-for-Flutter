import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../converters/offsetdatetime_json_converter.dart';

part 'get_user_integration_response_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class GetUserIntegrationResponseDto {
  final String identifier;
  final String displayName;
  final String logoUrl;
  final bool isConnected;
  final OffsetDateTime updatedOn;

  const GetUserIntegrationResponseDto({
    required this.identifier,
    required this.displayName,
    required this.logoUrl,
    required this.isConnected,
    required this.updatedOn,
  });

  factory GetUserIntegrationResponseDto.fromJson(Map<String, dynamic> json) => _$GetUserIntegrationResponseDtoFromJson(json);
}