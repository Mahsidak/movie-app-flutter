import 'package:dio/dio.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {

    var customHeaders = {
      'content-type': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNDE2NzU1MDU4MDQwZjRkYTJmNzIwNWM5MTRlOWE5ZCIsIm5iZiI6MTczMTMzMzQzMi43MTE1MjIsInN1YiI6IjY0MzNlNGRmNmRlYTNhMDBmMzk4N2U0YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.D_ucdiQmtRZ0dKXpoHoikiMPIM9tJw0dXKeJL2im7lM'
    };

    return customHeaders;
  }
}