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
import '../persistence/cacheable_resource.dart';

abstract class SessionSampleClient {
  /// Retrieve a user's heart rate summary samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;HeartRateSummarySampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<HeartRateSummarySampleModel>>> listHeartRateSummarySamplesByInterval(int id, {int? userId, int? intervalInSeconds, DateTime? ifModifiedSince});

  /// Retrieve a user's acceleration samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;AccelerationSampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<AccelerationSampleModel>>> listAccelerationSamples(int id, {int? userId, DateTime? ifModifiedSince});

  /// Retrieve a users's active energy burned samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;ActiveEnergyBurnedSampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<ActiveEnergyBurnedSampleModel>>> listActiveEnergyBurnedSamples(int id, {int? userId, DateTime? ifModifiedSince});

  /// Retrieve a user's basal energy burned samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;BasalEnergyBurnedSampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<BasalEnergyBurnedSampleModel>>> listBasalEnergyBurnedSamples(int id, {int? userId, DateTime? ifModifiedSince});

  /// Retrieve a user's cadence samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;CadenceSampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<CadenceSampleModel>>> listCadenceSamples(int id, {int? userId, DateTime? ifModifiedSince});

  /// Retrieve a user's distance samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;DistanceSampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<DistanceSampleModel>>> listDistanceSamples(int id, {int? userId, DateTime? ifModifiedSince});

  /// Retrieve a user's exercise time samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;ExerciseTimeSampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<ExerciseTimeSampleModel>>> listExerciseTimeSamples(int id, {int? userId, DateTime? ifModifiedSince});

  /// Retrieve a user's gyro samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;GyroSampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<GyroSampleModel>>> listGyroSamples(int id, {int? userId, DateTime? ifModifiedSince});

  /// Retrieve a user's heart rate samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;HeartRateSampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<HeartRateSampleModel>>> listHeartRateSamples(int id, {int? userId, DateTime? ifModifiedSince});

  /// Retrieve a user's heart rate variability samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;HeartRateVariabilitySampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<HeartRateVariabilitySampleModel>>> listHeartRateVariabilitySamples(int id, {int? userId, DateTime? ifModifiedSince});

  /// Retrieve a user's magnetic field samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;MagneticFieldSampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<MagneticFieldSampleModel>>> listMagneticFieldSamples(int id, {int? userId, DateTime? ifModifiedSince});

  /// Retrieve a user's power samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;PowerSampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<PowerSampleModel>>> listPowerSamples(int id, {int? userId, DateTime? ifModifiedSince});

  /// Retrieve a user's oxygen saturation samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;OxygenSaturationSampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<OxygenSaturationSampleModel>>> listOxygenSaturationSamples(int id, {int? userId, DateTime? ifModifiedSince});

  /// Retrieve a user's resting heart rate samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;RestingHeartRateSampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<RestingHeartRateSampleModel>>> listRestingHeartRateSamples(int id, {int? userId, DateTime? ifModifiedSince});

  /// Retrieve a user's location samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;LocationSampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<LocationSampleModel>>> listLocationSamples(int id, {int? userId, DateTime? ifModifiedSince});

  /// Retrieve a user's step samples for the given session [id]. A null [userId] defaults to the currently authenticated user.
  /// If [intervalInSeconds] is provided, the samples will be interpolated to the given number of seconds.
  ///
  /// [ifModifiedSince] is used for change detection. Send the latest [ifModifiedSince] returned by the [CacheableResource], or NULL to always
  /// refresh the data.
  ///
  /// Returns a [List&lt;StepSampleModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<StepSampleModel>>> listStepSamples(int id, {int? userId, DateTime? ifModifiedSince});
}
