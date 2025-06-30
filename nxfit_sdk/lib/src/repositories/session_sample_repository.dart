import '../models/samples/acceleration_sample_model.dart';
import '../models/samples/active_energy_burned_sample_model.dart';
import '../models/samples/basal_energy_burned_sample_model.dart';
import '../models/samples/cadence_sample_model.dart';
import '../models/samples/distance_sample_model.dart';
import '../models/samples/exercise_time_sample_model.dart';
import '../models/samples/gyro_sample_model.dart';
import '../models/samples/heart_rate_sample_model.dart';
import '../models/samples/heart_rate_summary_sample_model.dart';
import '../models/samples/heart_rate_variability_sample_model.dart';
import '../models/samples/location_sample_model.dart';
import '../models/samples/magnetic_field_sample_model.dart';
import '../models/samples/oxygen_saturation_sample_model.dart';
import '../models/samples/power_sample_model.dart';
import '../models/samples/resting_heart_rate_sample_model.dart';
import '../models/samples/step_sample_model.dart';

abstract class SessionSampleRepository {
  /// Retrieve a user's heart rate summary samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<HeartRateSummarySampleModel>> listHeartRateSummarySamplesByInterval(int id, {int? userId, int? intervalInSeconds});

  /// Retrieve a user's acceleration samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<AccelerationSampleModel>> listAccelerationSamples(int id, {int? userId});

  /// Retrieve a users's active energy burned samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<ActiveEnergyBurnedSampleModel>> listActiveEnergyBurnedSamples(int id, {int? userId});

  /// Retrieve a user's basal energy burned samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<BasalEnergyBurnedSampleModel>> listBasalEnergyBurnedSamples(int id, {int? userId});

  /// Retrieve a user's cadence samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<CadenceSampleModel>> listCadenceSamples(int id, {int? userId});

  /// Retrieve a user's distance samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<DistanceSampleModel>> listDistanceSamples(int id, {int? userId});

  /// Retrieve a user's exercise time samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<ExerciseTimeSampleModel>> listExerciseTimeSamples(int id, {int? userId});

  /// Retrieve a user's gyro samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<GyroSampleModel>> listGyroSamples(int id, {int? userId});

  /// Retrieve a user's heart rate samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<HeartRateSampleModel>> listHeartRateSamples(int id, {int? userId});

  /// Retrieve a user's heart rate variability samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<HeartRateVariabilitySampleModel>> listHeartRateVariabilitySamples(int id, {int? userId});

  /// Retrieve a user's magnetic field samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<MagneticFieldSampleModel>> listMagneticFieldSamples(int id, {int? userId});

  /// Retrieve a user's power samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<PowerSampleModel>> listPowerSamples(int id, {int? userId});

  /// Retrieve a user's oxygen saturation samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<OxygenSaturationSampleModel>> listOxygenSaturationSamples(int id, {int? userId});

  /// Retrieve a user's resting heart rate samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<RestingHeartRateSampleModel>> listRestingHeartRateSamples(int id, {int? userId});

  /// Retrieve a user's location samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<LocationSampleModel>> listLocationSamples(int id, {int? userId});

  /// Retrieve a user's step samples for the given session id. A null userId defaults to the currently authenticated user.
  Stream<List<StepSampleModel>> listStepSamples(int id, {int? userId});
}
