// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distance_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistanceSample _$DistanceSampleFromJson(Map<String, dynamic> json) =>
    DistanceSample(
      timestamp: const OffsetDateTimeJsonConverter()
          .fromJson(json['timestamp'] as String),
      intervalInSeconds: (json['intervalInSeconds'] as num).toInt(),
      activeTimeInSeconds: (json['activeTimeInSeconds'] as num).toInt(),
      meters: (json['meters'] as num).toDouble(),
      type: (json['type'] as num).toInt(),
    );
