import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

@internal
class AuthInterceptor extends Interceptor {
  final String? Function() _accessTokenProvider;

  AuthInterceptor(this._accessTokenProvider);

  @override void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = _accessTokenProvider() ?? "";

    options.headers['Authorization'] = "Bearer $accessToken";

    super.onRequest(options, handler);
  }
}
