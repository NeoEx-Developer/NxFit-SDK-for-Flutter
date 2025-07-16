// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heart_rate_summary_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeartRateSummarySample _$HeartRateSummarySampleFromJson(
        Map<String, dynamic> json) =>
    HeartRateSummarySample(
      intervalInSeconds: (json['intervalInSeconds'] as num).toInt(),
      activeTimeInSeconds: (json['activeTimeInSeconds'] as num).toInt(),
      avgBPM: (json['avgBPM'] as num).toDouble(),
      minBPM: (json['minBPM'] as num).toInt(),
      maxBPM: (json['maxBPM'] as num).toInt(),
    );
