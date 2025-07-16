// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_settings_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileSettingsResponseDto _$GetProfileSettingsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetProfileSettingsResponseDto(
      defaultSessionPrivacy: json['defaultSessionPrivacy'] as String,
      primaryLocationId: (json['primaryLocationId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetProfileSettingsResponseDtoToJson(
        GetProfileSettingsResponseDto instance) =>
    <String, dynamic>{
      'defaultSessionPrivacy': instance.defaultSessionPrivacy,
      'primaryLocationId': instance.primaryLocationId,
    };
