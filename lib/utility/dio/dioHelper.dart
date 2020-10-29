import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_cubit_bloc_tutorial/utility/log/DioLogger.dart';
import 'package:flutter_cubit_bloc_tutorial/utility/http/HttpException.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioProvider {
  static const String TAG = 'DioProvider';

  static const String _baseUrl = 'https://fakestoreapi.com';

  Dio dio;

  DioProvider() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = DioProvider._baseUrl;

    dio = Dio(dioOptions);

    dio.interceptors.add(InterceptorsWrapper(onResponse: (Response response) {
      DioLogger.onSuccess(TAG, response);
      return response;
    }, onError: (DioError error) async {
      DioLogger.onError(TAG, error);
      // Do something with response error
      if (error.response?.statusCode == 401) {
        dio.interceptors.requestLock.lock();
        dio.interceptors.responseLock.lock();
        RequestOptions options = error.response.request;
        dio.interceptors.requestLock.unlock();
        dio.interceptors.responseLock.unlock();
        return dio.request(options.path, data: options.data, options: options);
      } else {
        return error;
      }
    }));
  }

  void throwIfNoSuccess(Response response) {
    if (response.statusCode < 200 || response.statusCode > 299) {
      throw new HttpException(response);
    }
  }
}
