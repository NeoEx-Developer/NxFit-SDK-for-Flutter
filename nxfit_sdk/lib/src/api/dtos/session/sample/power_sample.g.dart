// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'power_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PowerSample _$PowerSampleFromJson(Map<String, dynamic> json) => PowerSample(
  timestamp: const OffsetDateTimeJsonConverter().fromJson(
    json['timestamp'] as String,
  ),
  intervalInSeconds: (json['intervalInSeconds'] as num).toInt(),
  activeTimeInSeconds: (json['activeTimeInSeconds'] as num).toInt(),
  watts: (json['watts'] as num).toInt(),
);
