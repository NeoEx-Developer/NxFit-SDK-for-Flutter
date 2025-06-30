import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

@internal
class CacheControlInterceptor extends Interceptor {

  @override void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Cache-Control'] = 'no-cache';

    super.onRequest(options, handler);
  }
}
