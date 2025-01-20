import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:result_dart/result_dart.dart';

class ClientHttp {
  final Dio _dio;

  ClientHttp(this._dio);

  AsyncResult<Response> get(String path, {Map<String, String>? headers}) async {
    try {
      final response = await _dio.get(path, options: Options(headers: headers));
      return Success(response);
    } on DioException catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<Response> post(String path, {Map<String, String>? headers, dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data, options: Options(headers: headers));
      return Success(response);
    } on DioException catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<Response> put(String path, {Map<String, String>? headers, dynamic data}) async {
    try {
      final response = await _dio.put(path, data: data, options: Options(headers: headers));
      return Success(response);
    } on DioException catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<Response> delete(String path, {Map<String, String>? headers}) async {
    try {
      final response = await _dio.delete(path, options: Options(headers: headers));
      return Success(response);
    } on DioException catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<Response> patch(String path, {Map<String, String>? headers, dynamic data}) async {
    try {
      final response = await _dio.patch(path, data: data, options: Options(headers: headers));
      return Success(response);
    } on DioException catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<File> downloadFile(String url, String fileName, void Function(double) progress) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);

      if (file.existsSync()) {
        file.deleteSync(recursive: true);
      }

      await _dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            progress(received / total);
          }
        },
      );

      return Success(file);
    } on DioException catch (e) {
      return Failure(e);
    }
  }
}
