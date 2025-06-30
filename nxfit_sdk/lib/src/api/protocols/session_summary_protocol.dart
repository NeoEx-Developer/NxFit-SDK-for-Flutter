import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/summary/get_heart_rate_zone_summaries_response_dto.dart';
import '../dtos/summary/get_session_metrics_response_dto.dart';
import '../helpers/quoted_string.dart';

part 'session_summary_protocol.g.dart';

@internal
@RestApi()
abstract class SessionSummaryProtocol {
  factory SessionSummaryProtocol(Dio dio, {String baseUrl}) = _SessionSummaryProtocol;

  @GET("/users/{userId}/sessions/metrics")
  Future<HttpResponse<GetSessionMetricsResponseDto>> get(@Path("userId") int userId, @Query("from") DateTime? from, @Query("to") DateTime? to, { @Header(HttpHeaders.ifNoneMatchHeader) QuotedString? eTag = null });

  @GET("/users/{userId}/sessions/heartrate-zones")
  Future<HttpResponse<GetHeartRateZoneSummariesResponseDto>> listHeartRateZones(@Path("userId") int userId, @Query("from")DateTime? from, @Query("to")DateTime? to, { @Header(HttpHeaders.ifNoneMatchHeader)QuotedString? eTag = null });
}
