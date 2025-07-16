// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_settings_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileSettingsRequestDto _$UpdateProfileSettingsRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileSettingsRequestDto(
      defaultSessionPrivacy: json['defaultSessionPrivacy'] as String,
      primaryLocationId: (json['primaryLocationId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UpdateProfileSettingsRequestDtoToJson(
        UpdateProfileSettingsRequestDto instance) =>
    <String, dynamic>{
      'defaultSessionPrivacy': instance.defaultSessionPrivacy,
      'primaryLocationId': instance.primaryLocationId,
    };
