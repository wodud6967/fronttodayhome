
import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.0.117:8080", // 서버 IP:PORT 입력
    contentType: "application/json; charset=utf-8",
  ),
);