// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_session_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSessionRequestDto _$CreateSessionRequestDtoFromJson(
        Map<String, dynamic> json) =>
    CreateSessionRequestDto(
      json['externalId'] as String?,
      (json['activityType'] as num).toInt(),
      (json['sourceId'] as num).toInt(),
      json['sourceAppName'] as String,
      json['sourceDeviceName'] as String?,
      json['sourceDeviceManufacturer'] as String?,
      json['sourceDeviceModel'] as String?,
      json['sourceDeviceHardwareVersion'] as String?,
      json['sourceDeviceSoftwareVersion'] as String?,
      json['syncDevice'] as String,
      json['syncDeviceOS'] as String?,
      json['syncDeviceOSVersion'] as String?,
      json['syncDeviceAppVersion'] as String?,
      _$JsonConverterFromJson<String, OffsetDateTime>(
          json['startedOnLocal'], const OffsetDateTimeJsonConverter().fromJson),
      _$JsonConverterFromJson<String, OffsetDateTime>(
          json['endedOnLocal'], const OffsetDateTimeJsonConverter().fromJson),
      (json['activeDurationInSeconds'] as num).toInt(),
      json['syncId'] as String?,
      json['syncVersion'] as String?,
    );

Map<String, dynamic> _$CreateSessionRequestDtoToJson(
        CreateSessionRequestDto instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'activityType': instance.activityType,
      'sourceId': instance.sourceId,
      'sourceAppName': instance.sourceAppName,
      'sourceDeviceName': instance.sourceDeviceName,
      'sourceDeviceManufacturer': instance.sourceDeviceManufacturer,
      'sourceDeviceModel': instance.sourceDeviceModel,
      'sourceDeviceHardwareVersion': instance.sourceDeviceHardwareVersion,
      'sourceDeviceSoftwareVersion': instance.sourceDeviceSoftwareVersion,
      'syncDevice': instance.syncDevice,
      'syncDeviceOS': instance.syncDeviceOS,
      'syncDeviceOSVersion': instance.syncDeviceOSVersion,
      'syncDeviceAppVersion': instance.syncDeviceAppVersion,
      'startedOnLocal': _$JsonConverterToJson<String, OffsetDateTime>(
          instance.startedOnLocal, const OffsetDateTimeJsonConverter().toJson),
      'endedOnLocal': _$JsonConverterToJson<String, OffsetDateTime>(
          instance.endedOnLocal, const OffsetDateTimeJsonConverter().toJson),
      'activeDurationInSeconds': instance.activeDurationInSeconds,
      'syncId': instance.syncId,
      'syncVersion': instance.syncVersion,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
