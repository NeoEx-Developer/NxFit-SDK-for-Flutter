import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:meta/meta.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../dtos/profile/get_personal_profile_response_dto.dart';
import '../dtos/profile/get_profile_settings_response_dto.dart';
import '../dtos/profile/get_public_profile_response_dto.dart';
import '../dtos/profile/update_profile_request_dto.dart';
import '../dtos/profile/update_profile_settings_request_dto.dart';
import '../helpers/quoted_string.dart';

part 'profile_protocol.g.dart';

@internal
@RestApi()
abstract class ProfileProtocol {
  factory ProfileProtocol(Dio dio, {String baseUrl}) = _ProfileProtocol;

  @GET("user")
  Future<HttpResponse<GetPersonalProfileResponseDto>> getPersonalProfile({
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
    @Header(HttpHeaders.ifNoneMatchHeader) QuotedString? eTag,
  });

  @GET("users/{userId}")
  Future<HttpResponse<GetPublicProfileResponseDto>> getPublicProfile({
    @Path("userId") required int userId,
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
    @Header(HttpHeaders.ifNoneMatchHeader) QuotedString? eTag,
  });

  @PUT("user")
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<HttpResponse<void>> update(@Body() UpdateProfileRequestDto dto);

  @DELETE("user")
  Future<HttpResponse<void>> delete();

  // TODO Remove this and replace with a dio call directly: https://stackoverflow.com/a/76127892/1011688
  // @POST("user/image")
  // Future<HttpResponse<PostProfileImageResponseDto>> updateImage(@Header("Content-Type") String contentType, @Body() Object bytes);

  @DELETE("user/image")
  Future<HttpResponse<void>> deleteImage();

  @GET("user/settings")
  Future<HttpResponse<GetProfileSettingsResponseDto>> getSettings({
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
    @Header(HttpHeaders.ifNoneMatchHeader) QuotedString? eTag,
  });

  @PUT("user/settings")
  Future<HttpResponse<void>> updateSettings(@Body() UpdateProfileSettingsRequestDto dto);
}
