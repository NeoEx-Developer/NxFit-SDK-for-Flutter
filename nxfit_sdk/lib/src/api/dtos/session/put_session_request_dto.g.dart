// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_session_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PutSessionRequestDto _$PutSessionRequestDtoFromJson(
        Map<String, dynamic> json) =>
    PutSessionRequestDto(
      activityId: json['activityId'] as String,
      activityType: json['activityType'] as String,
      startedOnLocal: const OffsetDateTimeJsonConverter()
          .fromJson(json['startedOnLocal'] as String),
      endedOnLocal: const OffsetDateTimeJsonConverter()
          .fromJson(json['endedOnLocal'] as String),
      completedOn: _$JsonConverterFromJson<String, OffsetDateTime>(
          json['completedOn'], const OffsetDateTimeJsonConverter().fromJson),
      activeDurationInSeconds: (json['activeDurationInSeconds'] as num).toInt(),
      syncId: json['syncId'] as String?,
      syncVersion: json['syncVersion'] as String?,
      privacy: json['privacy'] as String,
    );

Map<String, dynamic> _$PutSessionRequestDtoToJson(
        PutSessionRequestDto instance) =>
    <String, dynamic>{
      'activityId': instance.activityId,
      'activityType': instance.activityType,
      'startedOnLocal':
          const OffsetDateTimeJsonConverter().toJson(instance.startedOnLocal),
      'endedOnLocal':
          const OffsetDateTimeJsonConverter().toJson(instance.endedOnLocal),
      'completedOn': _$JsonConverterToJson<String, OffsetDateTime>(
          instance.completedOn, const OffsetDateTimeJsonConverter().toJson),
      'activeDurationInSeconds': instance.activeDurationInSeconds,
      'syncId': instance.syncId,
      'syncVersion': instance.syncVersion,
      'privacy': instance.privacy,
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
