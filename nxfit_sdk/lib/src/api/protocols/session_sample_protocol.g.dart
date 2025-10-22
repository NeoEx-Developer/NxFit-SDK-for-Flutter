// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_sample_protocol.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _SessionSampleProtocol implements SessionSampleProtocol {
  _SessionSampleProtocol(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<HttpResponse<ListSampleRequestDto<HeartRateSummarySample>>>
  listHeartRateSummarySamplesByInterval(
    int userId,
    int id, {
    int? intervalInSeconds = null,
    DateTime? ifModifiedSince,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'intervalInSeconds': intervalInSeconds,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<
          HttpResponse<ListSampleRequestDto<HeartRateSummarySample>>
        >(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/heartrate/interval',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<HeartRateSummarySample> _value;
    try {
      _value = ListSampleRequestDto<HeartRateSummarySample>.fromJson(
        _result.data!,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ListSampleRequestDto<AccelerationSample>>>
  listAccelerationSamples(
    int userId,
    int id, {
    DateTime? ifModifiedSince,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<ListSampleRequestDto<AccelerationSample>>>(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/acceleration',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<AccelerationSample> _value;
    try {
      _value = ListSampleRequestDto<AccelerationSample>.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ListSampleRequestDto<ActiveEnergyBurnedSample>>>
  listActiveEnergyBurnedSamples(
    int userId,
    int id, {
    DateTime? ifModifiedSince,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<
          HttpResponse<ListSampleRequestDto<ActiveEnergyBurnedSample>>
        >(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/active-energy-burned',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<ActiveEnergyBurnedSample> _value;
    try {
      _value = ListSampleRequestDto<ActiveEnergyBurnedSample>.fromJson(
        _result.data!,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ListSampleRequestDto<BasalEnergyBurnedSample>>>
  listBasalEnergyBurnedSamples(
    int userId,
    int id, {
    DateTime? ifModifiedSince,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<
          HttpResponse<ListSampleRequestDto<BasalEnergyBurnedSample>>
        >(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/basal-energy-burned',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<BasalEnergyBurnedSample> _value;
    try {
      _value = ListSampleRequestDto<BasalEnergyBurnedSample>.fromJson(
        _result.data!,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ListSampleRequestDto<CadenceSample>>> listCadenceSamples(
    int userId,
    int id, {
    DateTime? ifModifiedSince,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<ListSampleRequestDto<CadenceSample>>>(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/cadence',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<CadenceSample> _value;
    try {
      _value = ListSampleRequestDto<CadenceSample>.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ListSampleRequestDto<DistanceSample>>>
  listDistanceSamples(int userId, int id, {DateTime? ifModifiedSince}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<ListSampleRequestDto<DistanceSample>>>(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/distance',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<DistanceSample> _value;
    try {
      _value = ListSampleRequestDto<DistanceSample>.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ListSampleRequestDto<ExerciseTimeSample>>>
  listExerciseTimeSamples(
    int userId,
    int id, {
    DateTime? ifModifiedSince,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<ListSampleRequestDto<ExerciseTimeSample>>>(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/exercise-time',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<ExerciseTimeSample> _value;
    try {
      _value = ListSampleRequestDto<ExerciseTimeSample>.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ListSampleRequestDto<GyroSample>>> listGyroSamples(
    int userId,
    int id, {
    DateTime? ifModifiedSince,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<ListSampleRequestDto<GyroSample>>>(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/gyro',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<GyroSample> _value;
    try {
      _value = ListSampleRequestDto<GyroSample>.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ListSampleRequestDto<HeartRateSample>>>
  listHeartRateSamples(int userId, int id, {DateTime? ifModifiedSince}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<ListSampleRequestDto<HeartRateSample>>>(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/heartrate',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<HeartRateSample> _value;
    try {
      _value = ListSampleRequestDto<HeartRateSample>.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ListSampleRequestDto<HeartRateVariabilitySample>>>
  listHeartRateVariabilitySamples(
    int userId,
    int id, {
    DateTime? ifModifiedSince,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<
          HttpResponse<ListSampleRequestDto<HeartRateVariabilitySample>>
        >(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/heartrate-variability',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<HeartRateVariabilitySample> _value;
    try {
      _value = ListSampleRequestDto<HeartRateVariabilitySample>.fromJson(
        _result.data!,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ListSampleRequestDto<MagneticFieldSample>>>
  listMagneticFieldSamplesAsync(
    int userId,
    int id, {
    DateTime? ifModifiedSince,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<ListSampleRequestDto<MagneticFieldSample>>>(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/magnetic-field',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<MagneticFieldSample> _value;
    try {
      _value = ListSampleRequestDto<MagneticFieldSample>.fromJson(
        _result.data!,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ListSampleRequestDto<PowerSample>>> listPowerSamplesAsync(
    int userId,
    int id, {
    DateTime? ifModifiedSince,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<ListSampleRequestDto<PowerSample>>>(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/power',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<PowerSample> _value;
    try {
      _value = ListSampleRequestDto<PowerSample>.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ListSampleRequestDto<OxygenSaturationSample>>>
  listOxygenSaturationSamples(
    int userId,
    int id, {
    DateTime? ifModifiedSince,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<
          HttpResponse<ListSampleRequestDto<OxygenSaturationSample>>
        >(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/oxygen-saturation',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<OxygenSaturationSample> _value;
    try {
      _value = ListSampleRequestDto<OxygenSaturationSample>.fromJson(
        _result.data!,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ListSampleRequestDto<RestingHeartRateSample>>>
  listRestingHeartRateSamples(
    int userId,
    int id, {
    DateTime? ifModifiedSince,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<
          HttpResponse<ListSampleRequestDto<RestingHeartRateSample>>
        >(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/resting-heartrate',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<RestingHeartRateSample> _value;
    try {
      _value = ListSampleRequestDto<RestingHeartRateSample>.fromJson(
        _result.data!,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ListSampleRequestDto<LocationSample>>>
  listLocationSamples(int userId, int id, {DateTime? ifModifiedSince}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<ListSampleRequestDto<LocationSample>>>(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/location',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<LocationSample> _value;
    try {
      _value = ListSampleRequestDto<LocationSample>.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ListSampleRequestDto<StepSample>>> listStepSamples(
    int userId,
    int id, {
    DateTime? ifModifiedSince,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'if-modified-since': ifModifiedSince};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<ListSampleRequestDto<StepSample>>>(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'users/${userId}/sessions/${id}/samples/steps',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListSampleRequestDto<StepSample> _value;
    try {
      _value = ListSampleRequestDto<StepSample>.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on
