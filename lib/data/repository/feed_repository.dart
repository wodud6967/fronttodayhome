
import 'package:fronttodayhome/core/utils.dart';
import 'package:fronttodayhome/models/Feed.dart';

class FeedRepository {
  Future<List<dynamic>> findAll() async {
    // 1. 통신 -> respons [header, body]
    var response = await dio.get("/api/feeds");

    // 2. body 부분
    // body 부분이 json array(List) 면 List<dynamic> 으로 받기
    // body 부분이 json(object) 면 Map<String, dynamic> 으로 받기
    List<dynamic> body = response.data["body"];

    return body;
  }
}