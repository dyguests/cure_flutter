import 'dart:async';

import 'package:http/http.dart' as http;

class PhotoService {
  static Future<http.Response> fetchPost() {
    return http.get('https://jsonplaceholder.typicode.com/posts/1');
  }
}
