import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../dtos/badge/get_badges_response_dto.dart';
import '../helpers/quoted_string.dart';

part 'badge_protocol.g.dart';

@internal
@RestApi()
abstract class BadgeProtocol {
    factory BadgeProtocol(Dio dio, { String baseUrl}) = _BadgeProtocol;

    @GET("user/badges")
    Future<HttpResponse<GetBadgesResponseDto>> getPersonalBadges(
        @Query("date") DateTime date,
        {
            @Query("limit") int? limit,
            @Header(HttpHeaders.ifNoneMatchHeader) QuotedString? etag
        }
    );

    @GET("users/{userId}/badges")
    Future<HttpResponse<GetBadgesResponseDto>> getPublicBadges(
        @Path("userId") int userId,
        @Query("date") DateTime date,
        {
          @Query("limit") int? limit,
          @Header(HttpHeaders.ifNoneMatchHeader) QuotedString? etag
        }
    );
}
