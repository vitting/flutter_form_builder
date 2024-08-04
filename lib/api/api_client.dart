import 'package:dio/dio.dart';

abstract interface class ApiClient {
  Future<Response<dynamic>> getAsync(
    String endpoint, {
    String? id,
    CancelToken? cancelToken,
  });

  Future<Response<dynamic>> putAsync(
    String endpoint, {
    String? id,
    Object? data,
    CancelToken? cancelToken,
  });

  Future<Response<dynamic>> postAsync(
    String endpoint, {
    String? id,
    Object? data,
    CancelToken? cancelToken,
  });
}

class ApiClientImpl implements ApiClient {
  late final Dio _dio;

  ApiClientImpl() {
    _dio = Dio(BaseOptions(
      baseUrl: 'http://localhost:3000',
    ));
  }

  @override
  Future<Response> getAsync(
    String endpoint, {
    String? id,
    CancelToken? cancelToken,
  }) {
    return _dio.get(
      endpoint,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> postAsync(String endpoint,
      {String? id, Object? data, CancelToken? cancelToken}) {
    return _dio.post(
      endpoint,
      data: data,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> putAsync(String endpoint,
      {String? id, Object? data, CancelToken? cancelToken}) {
    return _dio.put(
      endpoint,
      data: data,
      cancelToken: cancelToken,
    );
  }
}
