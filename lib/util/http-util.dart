import 'dart:io';

import 'package:dio/dio.dart';

class HttpUtil {
  static Dio _dio;
  static Dio get dio {
    if (_dio == null) {
      _dio = Dio();

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          // Here make your own SSL cert validation
          // if you want accept everything, just return true
          return true;
        };
      };
    }

    return _dio;
  }
}
