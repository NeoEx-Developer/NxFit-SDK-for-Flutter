// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_energy_burned_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveEnergyBurnedSample _$ActiveEnergyBurnedSampleFromJson(
        Map<String, dynamic> json) =>
    ActiveEnergyBurnedSample(
      timestamp: const OffsetDateTimeJsonConverter()
          .fromJson(json['timestamp'] as String),
      intervalInSeconds: (json['intervalInSeconds'] as num).toInt(),
      activeTimeInSeconds: (json['activeTimeInSeconds'] as num).toInt(),
      calories: (json['calories'] as num).toDouble(),
    );
