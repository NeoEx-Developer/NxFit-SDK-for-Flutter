import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/session/list_samples_request_dto.dart';
import '../dtos/session/sample/acceleration_sample.dart';
import '../dtos/session/sample/active_energy_burned_sample.dart';
import '../dtos/session/sample/basal_energy_burned_sample.dart';
import '../dtos/session/sample/cadence_sample.dart';
import '../dtos/session/sample/distance_sample.dart';
import '../dtos/session/sample/exercise_time_sample.dart';
import '../dtos/session/sample/gyro_sample.dart';
import '../dtos/session/sample/heart_rate_sample.dart';
import '../dtos/session/sample/heart_rate_summary_sample.dart';
import '../dtos/session/sample/heart_rate_variability_sample.dart';
import '../dtos/session/sample/location_sample.dart';
import '../dtos/session/sample/magnetic_field_sample.dart';
import '../dtos/session/sample/oxygen_saturation_sample.dart';
import '../dtos/session/sample/power_sample.dart';
import '../dtos/session/sample/resting_heart_rate_sample.dart';
import '../dtos/session/sample/step_sample.dart';

part 'session_sample_protocol.g.dart';

@internal
@RestApi()
abstract class SessionSampleProtocol {
  factory SessionSampleProtocol(Dio dio, {String baseUrl}) = _SessionSampleProtocol;

  static const baseUrl = "users/{userId}/sessions/{id}/samples";

  @GET("$baseUrl/heartrate/interval")
  Future<HttpResponse<ListSampleRequestDto<HeartRateSummarySample>>> listHeartRateSummarySamplesByInterval(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Query("intervalInSeconds") int? intervalInSeconds = null,
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });

  @GET("$baseUrl/acceleration")
  Future<HttpResponse<ListSampleRequestDto<AccelerationSample>>> listAccelerationSamples(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });

  @GET("$baseUrl/active-energy-burned")
  Future<HttpResponse<ListSampleRequestDto<ActiveEnergyBurnedSample>>> listActiveEnergyBurnedSamples(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });

  @GET("$baseUrl/basal-energy-burned")
  Future<HttpResponse<ListSampleRequestDto<BasalEnergyBurnedSample>>> listBasalEnergyBurnedSamples(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });

  @GET("$baseUrl/cadence")
  Future<HttpResponse<ListSampleRequestDto<CadenceSample>>> listCadenceSamples(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });

  @GET("$baseUrl/distance")
  Future<HttpResponse<ListSampleRequestDto<DistanceSample>>> listDistanceSamples(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });

  @GET("$baseUrl/exercise-time")
  Future<HttpResponse<ListSampleRequestDto<ExerciseTimeSample>>> listExerciseTimeSamples(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });

  @GET("$baseUrl/gyro")
  Future<HttpResponse<ListSampleRequestDto<GyroSample>>> listGyroSamples(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });

  @GET("$baseUrl/heartrate")
  Future<HttpResponse<ListSampleRequestDto<HeartRateSample>>> listHeartRateSamples(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });

  @GET("$baseUrl/heartrate-variability")
  Future<HttpResponse<ListSampleRequestDto<HeartRateVariabilitySample>>> listHeartRateVariabilitySamples(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });

  @GET("$baseUrl/magnetic-field")
  Future<HttpResponse<ListSampleRequestDto<MagneticFieldSample>>> listMagneticFieldSamplesAsync(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });

  @GET("$baseUrl/power")
  Future<HttpResponse<ListSampleRequestDto<PowerSample>>> listPowerSamplesAsync(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });

  @GET("$baseUrl/oxygen-saturation")
  Future<HttpResponse<ListSampleRequestDto<OxygenSaturationSample>>> listOxygenSaturationSamples(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });

  @GET("$baseUrl/resting-heartrate")
  Future<HttpResponse<ListSampleRequestDto<RestingHeartRateSample>>> listRestingHeartRateSamples(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });

  @GET("$baseUrl/location")
  Future<HttpResponse<ListSampleRequestDto<LocationSample>>> listLocationSamples(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });

  @GET("$baseUrl/steps")
  Future<HttpResponse<ListSampleRequestDto<StepSample>>> listStepSamples(
    @Path("userId") int userId,
    @Path("id") int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
  });
}
