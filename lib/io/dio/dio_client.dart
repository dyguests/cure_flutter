import 'package:cure/common/dart.dart';
import 'package:cure/io/dio/service/services.dart';
import 'package:dio/dio.dart';

class DioClient {
  static DioClient _instance;

  Dio _dio;

  PhotoService photoService;

  static DioClient getInstance() {
    if (_instance == null) {
      _instance = DioClient();
    }
    return _instance;
  }

  DioClient() {
    Options options = new Options(
      baseUrl: Constant.baseUrl,
//      connectTimeout: 5000,
//      receiveTimeout: 3000,
    );
    _dio = new Dio(options);

    photoService = PhotoService(_dio);
  }
}
