// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heart_rate_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeartRateSample _$HeartRateSampleFromJson(Map<String, dynamic> json) =>
    HeartRateSample(
      timestamp: const OffsetDateTimeJsonConverter().fromJson(
        json['timestamp'] as String,
      ),
      intervalInSeconds: (json['intervalInSeconds'] as num).toInt(),
      activeTimeInSeconds: (json['activeTimeInSeconds'] as num).toInt(),
      bpm: (json['bpm'] as num).toInt(),
    );
