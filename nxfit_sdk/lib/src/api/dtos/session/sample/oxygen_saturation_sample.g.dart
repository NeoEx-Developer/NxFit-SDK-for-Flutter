// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oxygen_saturation_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OxygenSaturationSample _$OxygenSaturationSampleFromJson(
        Map<String, dynamic> json) =>
    OxygenSaturationSample(
      timestamp: const OffsetDateTimeJsonConverter()
          .fromJson(json['timestamp'] as String),
      intervalInSeconds: (json['intervalInSeconds'] as num).toInt(),
      activeTimeInSeconds: (json['activeTimeInSeconds'] as num).toInt(),
      percent: (json['percent'] as num).toDouble(),
    );
