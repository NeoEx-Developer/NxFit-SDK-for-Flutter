
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'update_profile_settings_request_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: true)
class UpdateProfileSettingsRequestDto {
  final String defaultSessionPrivacy;
  final int? primaryLocationId;

  const UpdateProfileSettingsRequestDto({
    required this.defaultSessionPrivacy,
    this.primaryLocationId,
  });

  Map<String, dynamic> toJson() => _$UpdateProfileSettingsRequestDtoToJson(this);
}
