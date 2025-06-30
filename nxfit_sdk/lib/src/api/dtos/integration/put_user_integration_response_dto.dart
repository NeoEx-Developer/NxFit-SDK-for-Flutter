
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../converters/offsetdatetime_json_converter.dart';

part 'put_user_integration_response_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class PutUserIntegrationResponseDto {
  final String? authorizeUrl;

  const PutUserIntegrationResponseDto({
    required this.authorizeUrl,
  });

  factory PutUserIntegrationResponseDto.fromJson(Map<String, dynamic> json) => _$PutUserIntegrationResponseDtoFromJson(json);
}