import '../../core/utils.dart';

class ReadyRepository {
  Future<String> findUrl(int id) async {
    dynamic response = await dio.get("/pay/ready/$id");
    String nextUrl = response.data["body"];
    print(nextUrl);
    return nextUrl;
  }
}
