// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_session_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PutSessionRequestDto _$PutSessionRequestDtoFromJson(
        Map<String, dynamic> json) =>
    PutSessionRequestDto(
      activityType: json['activityType'] as String,
      startedOnLocal: const OffsetDateTimeJsonConverter()
          .fromJson(json['startedOnLocal'] as String),
      endedOnLocal: const OffsetDateTimeJsonConverter()
          .fromJson(json['endedOnLocal'] as String),
      activeDurationInSeconds: (json['activeDurationInSeconds'] as num).toInt(),
      privacy: json['privacy'] as String,
    );

Map<String, dynamic> _$PutSessionRequestDtoToJson(
        PutSessionRequestDto instance) =>
    <String, dynamic>{
      'activityType': instance.activityType,
      'startedOnLocal':
          const OffsetDateTimeJsonConverter().toJson(instance.startedOnLocal),
      'endedOnLocal':
          const OffsetDateTimeJsonConverter().toJson(instance.endedOnLocal),
      'activeDurationInSeconds': instance.activeDurationInSeconds,
      'privacy': instance.privacy,
    };
