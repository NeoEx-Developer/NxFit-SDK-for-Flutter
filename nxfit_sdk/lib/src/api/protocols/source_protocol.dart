import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:meta/meta.dart';
import 'package:nxfit_sdk/src/api/patch_doc.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/source/get_source_response_dto.dart';
import '../dtos/source/list_sources_response_dto.dart';
import '../dtos/source/update_source_priority_dto.dart';
import '../dtos/source/update_source_request_dto.dart';
import '../helpers/quoted_string.dart';

part 'source_protocol.g.dart';

@internal
@RestApi()
abstract class SourceProtocol {
  factory SourceProtocol(Dio dio, { String baseUrl}) = _SourceProtocol;

  @GET("user/sources/{id}")
  Future<HttpResponse<GetSourceResponseDto>> getSource(@Path("id") int id, {@Header(HttpHeaders.ifModifiedSinceHeader) DateTime? ifModifiedSince, @Header(HttpHeaders.ifNoneMatchHeader) QuotedString? eTag});

  @GET("user/sources")
  Future<HttpResponse<ListSourcesResponseDto>> listSources({@Header(HttpHeaders.ifNoneMatchHeader) QuotedString? eTag});

  @PATCH("user/sources/{id}")
  @Headers(<String, dynamic>{HttpHeaders.contentTypeHeader: "application/json-patch+json"})
  Future<HttpResponse<void>> patchSource(@Path("id") int id, @Body() List<PatchDocOperation> patchDoc);

  @PUT("user/sources/{id}")
  @Headers(<String, dynamic>{HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'})
  Future<HttpResponse<void>> update(@Path("id") int id, @Body() UpdateSourceRequestDto source);

  @PUT("user/sources/priorities")
  @Headers(<String, dynamic>{HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'})
  Future<HttpResponse<void>> updateSourcesPriorities(@Body() List<UpdateSourcePriorityRequestDto> priorities);

  @DELETE("user/sources/{id}")
  Future<HttpResponse<void>> deleteSource(@Path("id") int id);
}
