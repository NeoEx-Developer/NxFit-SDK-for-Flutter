import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:nxfit_sdk/src/exceptions/bad_request_exception.dart';
import 'package:nxfit_sdk/src/exceptions/gateway_timeout_exception.dart';
import 'package:nxfit_sdk/src/exceptions/not_unimplemented_exception.dart';
import 'package:nxfit_sdk/src/exceptions/service_unavailable_exception.dart';

import '../exceptions/bad_gateway_exception.dart';
import '../exceptions/conflict_exception.dart';
import '../exceptions/forbidden_exception.dart';
import '../exceptions/network_exception.dart';
import '../exceptions/not_modified_exception.dart';
import '../exceptions/unauthorized_exception.dart';

@internal
mixin ApiCaller {
  ///
  Future<T> apiCall<T>(Future<T> Function() callAction) async {
    try {
      return await callAction();
    }
    on DioException catch(e) {
      if (kDebugMode) {
        print("!!! DIO Exception Handled:");
        print(e);
        print(e.type);
      }

      if (e.type == DioExceptionType.badResponse) {
        final statusCode = e.response?.statusCode ?? 0;
        final message = e.response?.statusMessage ?? "Unknown error";
        final method = e.requestOptions.method;
        final url = e.requestOptions.baseUrl + e.requestOptions.path;

        switch (statusCode) {
          case 304: throw NotModifiedException(message: message, method: method, url: url, cause: e);
          case 400: throw BadRequestException(message: message, method: method, url: url, cause: e);
          case 401: throw UnauthorizedException(message: message, method: method, url: url, cause: e);
          case 403: throw ForbiddenException(message: message, method: method, url: url, cause: e);
          case 409: throw ConflictException(message: message, method: method, url: url, cause: e);
          case 501: throw NotImplementedException(message: message, method: method, url: url, cause: e);
          case 502: throw BadGatewayException(message: message, method: method, url: url, cause: e);
          case 503: throw ServiceUnavailableException(message: message, method: method, url: url, cause: e);
          case 504: throw GatewayTimeoutException(message: message, method: method, url: url, cause: e);
          default:
            throw NetworkException(statusCode, message: message, method: method, url: url, cause: e);
        }
      }

      rethrow;
    }
    on Exception catch (e) {
      print("Network error");
      print(e);

      rethrow;
    }
  }
}
