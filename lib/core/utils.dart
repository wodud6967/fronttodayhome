
import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.0.117:8080", // 서버 IP:PORT 입력
    contentType: "application/json; charset=utf-8",
    headers: {
      "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpZCI6MSwiZXhwIjoxNzI5NTU4NzgwLCJ1c2VybmFtZSI6InNzYXIifQ.8QpXcWVMAJtc_sYYp-8IJCGqA67IPxsm8Thd36i5kgR1jOXj9SV6Li9pDwkl0W7xJgxUHEllAW3lOOTMpITUQg",
    },
  ),
);