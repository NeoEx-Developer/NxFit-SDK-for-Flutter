// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequestDto _$UpdateProfileRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileRequestDto(
      emailAddress: json['emailAddress'] as String,
      givenName: json['givenName'] as String,
      familyName: json['familyName'] as String,
      imageUrl: json['imageUrl'] as String,
      dateOfBirth: const LocalDateJsonConverter()
          .fromJson(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$UpdateProfileRequestDtoToJson(
        UpdateProfileRequestDto instance) =>
    <String, dynamic>{
      'emailAddress': instance.emailAddress,
      'givenName': instance.givenName,
      'familyName': instance.familyName,
      'imageUrl': instance.imageUrl,
      'dateOfBirth':
          const LocalDateJsonConverter().toJson(instance.dateOfBirth),
    };
