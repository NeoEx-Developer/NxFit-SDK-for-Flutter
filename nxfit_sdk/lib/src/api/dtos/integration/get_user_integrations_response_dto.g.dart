// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_integrations_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserIntegrationsResponseDto _$GetUserIntegrationsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetUserIntegrationsResponseDto(
      integrations: (json['results'] as List<dynamic>)
          .map((e) => GetUserIntegrationsResponseDto_Integration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

GetUserIntegrationsResponseDto_Integration
    _$GetUserIntegrationsResponseDto_IntegrationFromJson(
            Map<String, dynamic> json) =>
        GetUserIntegrationsResponseDto_Integration(
          identifier: json['identifier'] as String,
          displayName: json['displayName'] as String,
          logoUrl: json['logoUrl'] as String,
          isConnected: json['isConnected'] as bool,
          updatedOn: const OffsetDateTimeJsonConverter()
              .fromJson(json['updatedOn'] as String),
        );
