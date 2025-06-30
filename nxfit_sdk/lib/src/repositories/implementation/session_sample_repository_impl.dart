import 'package:meta/meta.dart';

import '../../cache/persistent_cached_resource.dart';
import '../../clients/session_sample_client.dart';
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
import '../session_sample_repository.dart';

@internal
class SessionSampleRepositoryImpl extends SessionSampleRepository {
  final PersistentCachedResource _cachedResource;
  final SessionSampleClient _client;

  SessionSampleRepositoryImpl(this._cachedResource, this._client);

  @override
  Stream<List<AccelerationSampleModel>> listAccelerationSamples(int id, {int? userId}) {
    return _client.listAccelerationSamples(id, userId: userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<ActiveEnergyBurnedSampleModel>> listActiveEnergyBurnedSamples(int id, {int? userId}) {
    return _client.listActiveEnergyBurnedSamples(id, userId: userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<BasalEnergyBurnedSampleModel>> listBasalEnergyBurnedSamples(int id, {int? userId}) {
    return _client.listBasalEnergyBurnedSamples(id, userId: userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<CadenceSampleModel>> listCadenceSamples(int id, {int? userId}) {
    return _client.listCadenceSamples(id, userId: userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<DistanceSampleModel>> listDistanceSamples(int id, {int? userId}) {
    return _client.listDistanceSamples(id, userId: userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<ExerciseTimeSampleModel>> listExerciseTimeSamples(int id, {int? userId}) {
    return _client.listExerciseTimeSamples(id, userId: userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<GyroSampleModel>> listGyroSamples(int id, {int? userId}) {
    return _client.listGyroSamples(id, userId: userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<HeartRateSampleModel>> listHeartRateSamples(int id, {int? userId}) {
    return _client.listHeartRateSamples(id, userId: userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<HeartRateSummarySampleModel>> listHeartRateSummarySamplesByInterval(int id, {int? userId, int? intervalInSeconds}) {
    return _client.listHeartRateSummarySamplesByInterval(id, userId: userId, intervalInSeconds: intervalInSeconds)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<HeartRateVariabilitySampleModel>> listHeartRateVariabilitySamples(int id, {int? userId}) {
    return _client.listHeartRateVariabilitySamples(id, userId: userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<LocationSampleModel>> listLocationSamples(int id, {int? userId}) {
    return _client.listLocationSamples(id, userId: userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<MagneticFieldSampleModel>> listMagneticFieldSamples(int id, {int? userId}) {
    return _client.listMagneticFieldSamples(id, userId: userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<OxygenSaturationSampleModel>> listOxygenSaturationSamples(int id, {int? userId}) {
    return _client.listOxygenSaturationSamples(id, userId: userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<PowerSampleModel>> listPowerSamples(int id, {int? userId}) {
    return _client.listPowerSamples(id, userId: userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<RestingHeartRateSampleModel>> listRestingHeartRateSamples(int id, {int? userId}) {
    return _client.listRestingHeartRateSamples(id, userId: userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<List<StepSampleModel>> listStepSamples(int id, {int? userId}) {
    return _client.listStepSamples(id, userId: userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }
}
