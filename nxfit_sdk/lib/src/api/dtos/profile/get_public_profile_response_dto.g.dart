// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_public_profile_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPublicProfileResponseDto _$GetPublicProfileResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetPublicProfileResponseDto(
      id: (json['id'] as num).toInt(),
      givenName: json['givenName'] as String,
      familyName: json['familyName'] as String,
      imageUrl: json['imageUrl'] as String,
    );
