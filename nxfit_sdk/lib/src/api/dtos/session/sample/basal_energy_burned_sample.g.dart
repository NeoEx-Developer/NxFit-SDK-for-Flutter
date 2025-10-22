// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basal_energy_burned_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasalEnergyBurnedSample _$BasalEnergyBurnedSampleFromJson(
  Map<String, dynamic> json,
) => BasalEnergyBurnedSample(
  timestamp: const OffsetDateTimeJsonConverter().fromJson(
    json['timestamp'] as String,
  ),
  intervalInSeconds: (json['intervalInSeconds'] as num).toInt(),
  activeTimeInSeconds: (json['activeTimeInSeconds'] as num).toInt(),
  calories: (json['calories'] as num).toDouble(),
);
