// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_personal_profile_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPersonalProfileResponseDto _$GetPersonalProfileResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetPersonalProfileResponseDto(
      id: (json['id'] as num).toInt(),
      tenantId: (json['tenantId'] as num).toInt(),
      referenceId: json['referenceId'] as String?,
      emailAddress: json['emailAddress'] as String,
      givenName: json['givenName'] as String,
      familyName: json['familyName'] as String,
      imageUrl: json['imageUrl'] as String,
      dateOfBirth: const LocalDateJsonConverter()
          .fromJson(json['dateOfBirth'] as String),
      heartRateZoneThresholds:
          (json['heartRateZoneThresholds'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
    );
