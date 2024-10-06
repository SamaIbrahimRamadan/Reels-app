import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get() async {
    var response = await _dio.get('https://api.sawalef.app/api/v1/reels');
    return response.data;

  }
}