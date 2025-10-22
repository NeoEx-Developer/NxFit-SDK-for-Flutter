// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'magnetic_field_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MagneticFieldSample _$MagneticFieldSampleFromJson(Map<String, dynamic> json) =>
    MagneticFieldSample(
      timestamp: const OffsetDateTimeJsonConverter().fromJson(
        json['timestamp'] as String,
      ),
      intervalInSeconds: (json['intervalInSeconds'] as num).toInt(),
      activeTimeInSeconds: (json['activeTimeInSeconds'] as num).toInt(),
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
    );
