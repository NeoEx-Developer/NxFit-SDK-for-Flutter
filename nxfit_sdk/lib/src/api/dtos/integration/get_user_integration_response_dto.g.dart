// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_integration_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserIntegrationResponseDto _$GetUserIntegrationResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetUserIntegrationResponseDto(
      identifier: json['identifier'] as String,
      displayName: json['displayName'] as String,
      logoUrl: json['logoUrl'] as String,
      isLocal: json['isLocal'] as bool,
      isConnected: json['isConnected'] as bool,
      isEnabled: json['isEnabled'] as bool,
      updatedOn: const OffsetDateTimeJsonConverter()
          .fromJson(json['updatedOn'] as String),
    );
