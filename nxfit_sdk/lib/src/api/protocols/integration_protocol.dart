import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/integration/get_user_integration_response_dto.dart';
import '../dtos/integration/get_user_integrations_response_dto.dart';
import '../dtos/integration/put_user_integration_response_dto.dart';
import '../helpers/quoted_string.dart';

part 'integration_protocol.g.dart';

@internal
@RestApi(baseUrl: "user/integrations")
abstract class IntegrationProtocol {
  factory IntegrationProtocol(Dio dio, {String baseUrl}) = _IntegrationProtocol;

  @GET('user/integrations/{identifier}')
  Future<HttpResponse<GetUserIntegrationResponseDto>> getUserIntegration(
    @Path("integration") String integration, {
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
    @Header(HttpHeaders.ifNoneMatchHeader) QuotedString? eTag,
  });

  @GET('user/integrations')
  Future<HttpResponse<GetUserIntegrationsResponseDto>> getUserIntegrations({
    @Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince,
    @Header(HttpHeaders.ifNoneMatchHeader) QuotedString? eTag,
  });

  @PUT("user/integrations/{integration}")
  Future<HttpResponse<PutUserIntegrationResponseDto>> connectUserIntegration(@Path("integration") String integration, @Query("redirectUri") String redirectUri);

  @DELETE("user/integrations/{integration}")
  Future disconnectUserIntegration(@Path("integration") String integration);
}
