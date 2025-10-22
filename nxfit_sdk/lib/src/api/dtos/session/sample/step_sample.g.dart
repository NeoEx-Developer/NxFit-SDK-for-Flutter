// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepSample _$StepSampleFromJson(Map<String, dynamic> json) => StepSample(
  timestamp: const OffsetDateTimeJsonConverter().fromJson(
    json['timestamp'] as String,
  ),
  intervalInSeconds: (json['intervalInSeconds'] as num).toInt(),
  activeTimeInSeconds: (json['activeTimeInSeconds'] as num).toInt(),
  count: (json['count'] as num).toInt(),
);
