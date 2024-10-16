

import '../../core/utils.dart';
class ProductDetailRepository {
  // 상품 상세 정보를 가져오는 메서드
  Future<Map<String, dynamic>> findById(int productId) async {
    // 상품 ID를 통해 상세 정보 요청
    var response = await dio.get("/api/product/$productId");

    // 응답 데이터가 JSON 객체일 때 Map<String, dynamic>으로 처리
    Map<String, dynamic> json = response.data;

    return json;
  }
}