// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heart_rate_variability_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeartRateVariabilitySample _$HeartRateVariabilitySampleFromJson(
        Map<String, dynamic> json) =>
    HeartRateVariabilitySample(
      timestamp: const OffsetDateTimeJsonConverter()
          .fromJson(json['timestamp'] as String),
      intervalInSeconds: (json['intervalInSeconds'] as num).toInt(),
      activeTimeInSeconds: (json['activeTimeInSeconds'] as num).toInt(),
      variabilityMs: (json['variabilityMs'] as num).toDouble(),
    );
