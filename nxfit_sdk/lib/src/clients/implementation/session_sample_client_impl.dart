import 'package:meta/meta.dart';

import '../../api/api_caller.dart';
import '../../api/dtos/session/sample/acceleration_sample.dart';
import '../../api/dtos/session/sample/active_energy_burned_sample.dart';
import '../../api/dtos/session/sample/basal_energy_burned_sample.dart';
import '../../api/dtos/session/sample/cadence_sample.dart';
import '../../api/dtos/session/sample/distance_sample.dart';
import '../../api/dtos/session/sample/exercise_time_sample.dart';
import '../../api/dtos/session/sample/gyro_sample.dart';
import '../../api/dtos/session/sample/heart_rate_sample.dart';
import '../../api/dtos/session/sample/heart_rate_summary_sample.dart';
import '../../api/dtos/session/sample/heart_rate_variability_sample.dart';
import '../../api/dtos/session/sample/location_sample.dart';
import '../../api/dtos/session/sample/magnetic_field_sample.dart';
import '../../api/dtos/session/sample/oxygen_saturation_sample.dart';
import '../../api/dtos/session/sample/power_sample.dart';
import '../../api/dtos/session/sample/resting_heart_rate_sample.dart';
import '../../api/dtos/session/sample/step_sample.dart';
import '../../api/extensions/http_response_extensions.dart';
import '../../api/protocols/session_sample_protocol.dart';
import '../../auth/auth_provider.dart';
import '../../auth/auth_state.dart';
import '../../enums/distance_type.dart';
import '../../models/samples/acceleration_sample_model.dart';
import '../../models/samples/active_energy_burned_sample_model.dart';
import '../../models/samples/basal_energy_burned_sample_model.dart';
import '../../models/samples/cadence_sample_model.dart';
import '../../models/samples/distance_sample_model.dart';
import '../../models/samples/exercise_time_sample_model.dart';
import '../../models/samples/gyro_sample_model.dart';
import '../../models/samples/heart_rate_sample_model.dart';
import '../../models/samples/heart_rate_summary_sample_model.dart';
import '../../models/samples/heart_rate_variability_sample_model.dart';
import '../../models/samples/location_sample_model.dart';
import '../../models/samples/magnetic_field_sample_model.dart';
import '../../models/samples/oxygen_saturation_sample_model.dart';
import '../../models/samples/power_sample_model.dart';
import '../../models/samples/resting_heart_rate_sample_model.dart';
import '../../models/samples/step_sample_model.dart';
import '../../persistence/cacheable_resource.dart';
import '../session_sample_client.dart';

@internal
class SessionSampleClientImpl extends SessionSampleClient with ApiCaller {
  final SessionSampleProtocol _protocol;
  final AuthProvider _authProvider;

  int get _userId => _authProvider.currentAuthState.userId ?? 0;

  SessionSampleClientImpl(this._protocol, this._authProvider);

  @override
  @override
  Future<CacheableResource<List<AccelerationSampleModel>>> listAccelerationSamples(int id, {int? userId, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listAccelerationSamples(userId ?? _userId, id, ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }

  @override
  Future<CacheableResource<List<ActiveEnergyBurnedSampleModel>>> listActiveEnergyBurnedSamples(int id, {int? userId, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listActiveEnergyBurnedSamples(userId ?? _userId, id, ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }

  @override
  Future<CacheableResource<List<BasalEnergyBurnedSampleModel>>> listBasalEnergyBurnedSamples(int id, {int? userId, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listBasalEnergyBurnedSamples(userId ?? _userId, id, ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }

  @override
  Future<CacheableResource<List<CadenceSampleModel>>> listCadenceSamples(int id, {int? userId, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listCadenceSamples(userId ?? _userId, id, ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }

  @override
  Future<CacheableResource<List<DistanceSampleModel>>> listDistanceSamples(int id, {int? userId, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listDistanceSamples(userId ?? _userId, id, ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }

  @override
  Future<CacheableResource<List<ExerciseTimeSampleModel>>> listExerciseTimeSamples(int id, {int? userId, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listExerciseTimeSamples(userId ?? _userId, id, ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }

  @override
  Future<CacheableResource<List<GyroSampleModel>>> listGyroSamples(int id, {int? userId, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listGyroSamples(userId ?? _userId, id, ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }

  @override
  Future<CacheableResource<List<HeartRateSampleModel>>> listHeartRateSamples(int id, {int? userId, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listHeartRateSamples(userId ?? _userId, id, ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }

  @override
  Future<CacheableResource<List<HeartRateSummarySampleModel>>> listHeartRateSummarySamplesByInterval(int id, {int? userId, int? intervalInSeconds, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listHeartRateSummarySamplesByInterval(userId ?? _userId, id, ifModifiedSince: ifModifiedSince, intervalInSeconds: intervalInSeconds);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }

  @override
  Future<CacheableResource<List<HeartRateVariabilitySampleModel>>> listHeartRateVariabilitySamples(int id, {int? userId, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listHeartRateVariabilitySamples(userId ?? _userId, id, ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }

  @override
  Future<CacheableResource<List<LocationSampleModel>>> listLocationSamples(int id, {int? userId, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listLocationSamples(userId ?? _userId, id, ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }

  @override
  Future<CacheableResource<List<MagneticFieldSampleModel>>> listMagneticFieldSamples(int id, {int? userId, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listMagneticFieldSamplesAsync(userId ?? _userId, id, ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }

  @override
  Future<CacheableResource<List<OxygenSaturationSampleModel>>> listOxygenSaturationSamples(int id, {int? userId, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listOxygenSaturationSamples(userId ?? _userId, id, ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }

  @override
  Future<CacheableResource<List<PowerSampleModel>>> listPowerSamples(int id, {int? userId, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listPowerSamplesAsync(userId ?? _userId, id, ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }

  @override
  Future<CacheableResource<List<RestingHeartRateSampleModel>>> listRestingHeartRateSamples(int id, {int? userId, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listRestingHeartRateSamples(userId ?? _userId, id, ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }

  @override
  Future<CacheableResource<List<StepSampleModel>>> listStepSamples(int id, {int? userId, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.listStepSamples(userId ?? _userId, id, ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.samples.map((x) => x.asModel()).toList());
  }
}

extension _AccelerationSampleExtensions on AccelerationSample {
  @internal
  AccelerationSampleModel asModel() => AccelerationSampleModel(
        timestamp: timestamp,
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        x: x,
        y: y,
        z: z,
      );
}

extension _ActiveEnergyBurnedSampleExtensions on ActiveEnergyBurnedSample {
  @internal
  ActiveEnergyBurnedSampleModel asModel() => ActiveEnergyBurnedSampleModel(
        timestamp: timestamp,
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        calories: calories,
      );
}

extension _BasalEnergyBurnedSampleExtensions on BasalEnergyBurnedSample {
  @internal
  BasalEnergyBurnedSampleModel asModel() => BasalEnergyBurnedSampleModel(
        timestamp: timestamp,
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        calories: calories,
      );
}

extension _CadenceSampleExtensions on CadenceSample {
  @internal
  CadenceSampleModel asModel() => CadenceSampleModel(
        timestamp: timestamp,
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        valuePerMinute: valuePerMinute,
      );
}

extension _DistanceSampleExtensions on DistanceSample {
  @internal
  DistanceSampleModel asModel() => DistanceSampleModel(
        timestamp: timestamp,
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        meters: meters,
        type: DistanceType.values[type],
      );
}

extension _ExerciseTimeSampleExtensions on ExerciseTimeSample {
  @internal
  ExerciseTimeSampleModel asModel() => ExerciseTimeSampleModel(
        timestamp: timestamp,
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        minutes: minutes,
      );
}

extension _GyroSampleExtensions on GyroSample {
  @internal
  GyroSampleModel asModel() => GyroSampleModel(
        timestamp: timestamp,
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        x: x,
        y: y,
        z: z,
      );
}

extension _HeartRateSampleExtensions on HeartRateSample {
  @internal
  HeartRateSampleModel asModel() => HeartRateSampleModel(
        timestamp: timestamp,
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        bpm: bpm,
      );
}

extension _HeartRateSummarySampleExtensions on HeartRateSummarySample {
  @internal
  HeartRateSummarySampleModel asModel() => HeartRateSummarySampleModel(
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        avgBPM: avgBPM,
        minBPM: minBPM,
        maxBPM: maxBPM,
      );
}

extension _HeartRateVariabilitySampleExtensions on HeartRateVariabilitySample {
  @internal
  HeartRateVariabilitySampleModel asModel() => HeartRateVariabilitySampleModel(
        timestamp: timestamp,
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        variabilityMs: variabilityMs,
      );
}

extension _LocationSampleExtensions on LocationSample {
  @internal
  LocationSampleModel asModel() => LocationSampleModel(
        timestamp: timestamp,
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        latitude: latitude,
        longitude: longitude,
        altitude: altitude,
        speed: speed,
        heading: heading,
      );
}

extension _MagneticFieldSampleExtensions on MagneticFieldSample {
  @internal
  MagneticFieldSampleModel asModel() => MagneticFieldSampleModel(
        timestamp: timestamp,
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        x: x,
        y: y,
        z: z,
      );
}

extension _OxygenSaturationSampleExtensions on OxygenSaturationSample {
  @internal
  OxygenSaturationSampleModel asModel() => OxygenSaturationSampleModel(
        timestamp: timestamp,
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        percent: percent,
      );
}

extension _PowerSampleExtensions on PowerSample {
  @internal
  PowerSampleModel asModel() => PowerSampleModel(
        timestamp: timestamp,
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        watts: watts,
      );
}

extension _RestingHeartRateSampleExtensions on RestingHeartRateSample {
  @internal
  RestingHeartRateSampleModel asModel() => RestingHeartRateSampleModel(
        timestamp: timestamp,
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        bpm: bpm,
      );
}

extension _StepSampleExtensions on StepSample {
  @internal
  StepSampleModel asModel() => StepSampleModel(
        timestamp: timestamp,
        intervalInSeconds: intervalInSeconds,
        activeTime: Duration(seconds: activeTimeInSeconds),
        count: count,
      );
}
