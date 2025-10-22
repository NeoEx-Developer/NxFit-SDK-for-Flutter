// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_time_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseTimeSample _$ExerciseTimeSampleFromJson(Map<String, dynamic> json) =>
    ExerciseTimeSample(
      timestamp: const OffsetDateTimeJsonConverter().fromJson(
        json['timestamp'] as String,
      ),
      intervalInSeconds: (json['intervalInSeconds'] as num).toInt(),
      activeTimeInSeconds: (json['activeTimeInSeconds'] as num).toInt(),
      minutes: (json['minutes'] as num).toInt(),
    );
