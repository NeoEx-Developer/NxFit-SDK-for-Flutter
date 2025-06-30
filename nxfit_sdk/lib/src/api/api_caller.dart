import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../exceptions/conflict_exception.dart';
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
          case 401: throw UnauthorizedException(message: message, method: method, url: url, cause: e);
          case 409: throw ConflictException(message: message, method: method, url: url, cause: e);
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
