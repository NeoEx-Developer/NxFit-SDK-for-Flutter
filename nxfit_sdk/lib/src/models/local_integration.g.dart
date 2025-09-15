// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_integration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalIntegration _$LocalIntegrationFromJson(Map<String, dynamic> json) =>
    LocalIntegration(
      json['identifier'] as String,
      json['isConnected'] as bool,
      $enumDecode(_$IntegrationAvailabilityEnumMap, json['availability']),
    );

Map<String, dynamic> _$LocalIntegrationToJson(LocalIntegration instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'isConnected': instance.isConnected,
      'availability': _$IntegrationAvailabilityEnumMap[instance.availability]!,
    };

const _$IntegrationAvailabilityEnumMap = {
  IntegrationAvailability.available: 'available',
  IntegrationAvailability.unavailable: 'unavailable',
  IntegrationAvailability.unsupported: 'unsupported',
};
