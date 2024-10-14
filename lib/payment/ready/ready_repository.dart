import '../../core/utils.dart';

class ReadyRepository {
  Future<String> findUrl() async {
    dynamic response = await dio.get("/pay/ready/1");
    String nextUrl = response.data["body"];
    print(nextUrl);
    return nextUrl;
  }
}
