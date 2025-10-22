// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resting_heart_rate_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestingHeartRateSample _$RestingHeartRateSampleFromJson(
  Map<String, dynamic> json,
) => RestingHeartRateSample(
  timestamp: const OffsetDateTimeJsonConverter().fromJson(
    json['timestamp'] as String,
  ),
  intervalInSeconds: (json['intervalInSeconds'] as num).toInt(),
  activeTimeInSeconds: (json['activeTimeInSeconds'] as num).toInt(),
  bpm: (json['bpm'] as num).toInt(),
);
