
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'get_profile_settings_response_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: true)
class GetProfileSettingsResponseDto {
  final String defaultSessionPrivacy;
  final int? primaryLocationId;

  const GetProfileSettingsResponseDto({
    required this.defaultSessionPrivacy,
    this.primaryLocationId,
  });

  factory GetProfileSettingsResponseDto.fromJson(Map<String, dynamic> json) => _$GetProfileSettingsResponseDtoFromJson(json);
}
