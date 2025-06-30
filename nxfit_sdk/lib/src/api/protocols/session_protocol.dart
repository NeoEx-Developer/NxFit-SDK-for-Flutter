import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/session/create_session_request_dto.dart';
import '../dtos/session/create_session_response_dto.dart';
import '../dtos/session/get_heart_rate_zone_summaries_response_dto.dart';
import '../dtos/session/get_sessions_response_dto.dart';
import '../dtos/session/get_user_session_response_dto.dart';
import '../dtos/session/get_user_sessions_response_dto.dart';
import '../dtos/session/put_session_request_dto.dart';
import '../helpers/quoted_string.dart';

part 'session_protocol.g.dart';

@internal
@RestApi()
abstract class SessionProtocol {
  factory SessionProtocol(Dio dio, {String baseUrl}) = _SessionProtocol;

  @POST("/users/{userId}/sessions")
  Future<HttpResponse<CreateSessionResponseDto>> post(@Path("userId") int userId, @Body() CreateSessionRequestDto body);

  @GET("/users/{userId}/sessions/{id}")
  Future<HttpResponse<GetUserSessionResponseDto>> get(
    @Path("userId") int userId,
    @Path() int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
    @Header(HttpHeaders.ifNoneMatchHeader) QuotedString? eTag,
  });

  @GET("/users/{userId}/sessions")
  Future<HttpResponse<GetUserSessionsResponseDto>> listForUser(
    @Path("userId") int userId, {
    @Query("from") DateTime? from,
    @Query("to") DateTime? to,
    @Query("limit") int? limit,
    @Query("after") String? afterToken,
    @Query("before") String? beforeToken,
    @Header(HttpHeaders.ifNoneMatchHeader) QuotedString? eTag,
  });

  @GET("sessions")
  Future<HttpResponse<GetSessionsResponseDto>> list({
    @Query("from") DateTime? from,
    @Query("to") DateTime? to,
    @Query("filterBy") int? filterBy,
    @Query("limit") int? limit,
    @Query("after") String? afterToken,
    @Query("before") String? beforeToken,
    @Header(HttpHeaders.ifNoneMatchHeader) QuotedString? eTag,
  });

  @GET("/users/{userId}/sessions/{id}/heartrate-zones")
  Future<HttpResponse<GetHeartRateZoneSummariesResponseDto>> listHeartRateZonesForSession(
    @Path("userId") int userId,
    @Path() int id, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
    @Header(HttpHeaders.ifNoneMatchHeader) QuotedString? eTag,
  });

  @PUT("/users/{userId}/sessions/{id}")
  Future<HttpResponse<void>> put(
    @Path("userId") int userId,
    @Path() int id,
    @Body() PutSessionRequestDto body,
  );
}
