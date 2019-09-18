import 'package:dio/dio.dart';
import 'package:flutter_skeleton/util/http-util.dart';

class HelloWorldService {
  Future<Response<Map<String, dynamic>>> getTodo(int id) async {
    return await HttpUtil.dio
        .get('https://jsonplaceholder.typicode.com/todos/$id');
  }
}
