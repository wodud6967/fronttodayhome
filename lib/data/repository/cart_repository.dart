import 'package:dio/dio.dart';
import 'package:fronttodayhome/core/utils.dart';
import 'package:logger/logger.dart';

class CartRepository {
  // 장바구니 아이템 조회 메서드
  Future<List<dynamic>> findAll() async {
    var response = await dio.get("/api/cart");
    List<dynamic> body = response.data["body"];
    return body;
  }

  // 장바구니에 아이템 추가 메서드
  Future<void> addToCart({
    required int inventoryId,
    required int price,
    required int totalPrice,
  }) async {
    try {
      var response = await dio.post(
        "/api/cart",
        data: {
          "inventoryId": inventoryId,
          "price": price,
          "totalPrice": totalPrice,
        },
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to add item to cart.");
      }
    } catch (e) {
      print("Error adding to cart: $e");
      throw e;
    }
  }
  Future<Map<String, dynamic>> saveOrder(List<Map<String, int>> orderIds) async {
    var response = await dio.post("/api/order", data: orderIds);
    if(response.statusCode==200){
      Logger().d("성공!!");
    }
    Map<String, dynamic> body = response.data["body"];
    return body;

  }
}