// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadence_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CadenceSample _$CadenceSampleFromJson(Map<String, dynamic> json) =>
    CadenceSample(
      timestamp: const OffsetDateTimeJsonConverter()
          .fromJson(json['timestamp'] as String),
      intervalInSeconds: (json['intervalInSeconds'] as num).toInt(),
      activeTimeInSeconds: (json['activeTimeInSeconds'] as num).toInt(),
      valuePerMinute: (json['valuePerMinute'] as num).toInt(),
    );
