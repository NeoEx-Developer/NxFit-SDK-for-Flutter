import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'sample/acceleration_sample.dart';
import 'sample/active_energy_burned_sample.dart';
import 'sample/basal_energy_burned_sample.dart';
import 'sample/cadence_sample.dart';
import 'sample/distance_sample.dart';
import 'sample/exercise_time_sample.dart';
import 'sample/gyro_sample.dart';
import 'sample/heart_rate_sample.dart';
import 'sample/heart_rate_summary_sample.dart';
import 'sample/heart_rate_variability_sample.dart';
import 'sample/location_sample.dart';
import 'sample/magnetic_field_sample.dart';
import 'sample/oxygen_saturation_sample.dart';
import 'sample/power_sample.dart';
import 'sample/resting_heart_rate_sample.dart';
import 'sample/step_sample.dart';

part 'list_samples_request_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false) //, genericArgumentFactories: true) //
class ListSampleRequestDto<T> {
  @JsonKey(name: "results")
  @SampleModelConverter()
  final List<T> samples;

  const ListSampleRequestDto(this.samples);

  /// see: https://stackoverflow.com/questions/55306746/how-to-use-generics-and-list-of-generics-with-json-serialization-in-dart
  factory ListSampleRequestDto.fromJson(Map<String, dynamic> json) => _$ListSampleRequestDtoFromJson(json);

  //factory ListSampleRequestDto.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$ListSampleRequestDtoFromJson(json, fromJsonT);

//  factory CommonResponse.fromJson(Map<String, dynamic> json, T Function(Object json) fromJsonT,) => _$CommonResponseFromJson(json, fromJsonT);
  //
  //
  // Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$CommonResponseToJson(this, toJsonT);
}


@internal
@immutable
class SampleModelConverter<T> implements JsonConverter<T, Object> {
  const SampleModelConverter();

  @override
  T fromJson(Object jsonObject) {
    final json = jsonObject as Map<String, dynamic>;

    switch (T) {
      case AccelerationSample:
        return AccelerationSample.fromJson(json) as T;
      case ActiveEnergyBurnedSample:
        return ActiveEnergyBurnedSample.fromJson(json) as T;
      case BasalEnergyBurnedSample:
        return BasalEnergyBurnedSample.fromJson(json) as T;
      case CadenceSample:
        return CadenceSample.fromJson(json) as T;
      case DistanceSample:
        return DistanceSample.fromJson(json) as T;
      case ExerciseTimeSample:
        return ExerciseTimeSample.fromJson(json) as T;
      case GyroSample:
        return GyroSample.fromJson(json) as T;
      case HeartRateSample:
        return HeartRateSample.fromJson(json) as T;
      case HeartRateSummarySample:
        return HeartRateSummarySample.fromJson(json) as T;
      case HeartRateVariabilitySample:
        return HeartRateVariabilitySample.fromJson(json) as T;
      case LocationSample:
        return LocationSample.fromJson(json) as T;
      case MagneticFieldSample:
        return MagneticFieldSample.fromJson(json) as T;
      case OxygenSaturationSample:
        return OxygenSaturationSample.fromJson(json) as T;
      case PowerSample:
        return PowerSample.fromJson(json) as T;
      case RestingHeartRateSample:
        return RestingHeartRateSample.fromJson(json) as T;
      case StepSample:
        return StepSample.fromJson(json) as T;
      default:
        throw Exception("Encountered unknown sample type. This is likely caused by a new sample type added but was not added to the ListSamplesRequestDto as a possible sample type.");
    }
  }

  @override
  Object toJson(T object) {
    // TODO: implement toJson
    throw UnimplementedError("We should never call this as we never convert samples to json.");
  }
}
