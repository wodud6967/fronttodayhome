import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/data/repository/cart_repository.dart';
import 'package:logger/logger.dart';

class ShoppingCartItem {
  final int id;
  final int count;
  final int price;
  final int totalPrice;
  final int userId;
  final String name;
  final String title;
  final String content;
  final String mainPhoto;
  final String brandName;
  bool isChecked; // 체크박스 상태 추가

  ShoppingCartItem({
    required this.id,
    required this.count,
    required this.price,
    required this.totalPrice,
    required this.userId,
    required this.name,
    required this.title,
    required this.content,
    required this.mainPhoto,
    required this.brandName,
    this.isChecked = false, // 기본값 false
  });

  factory ShoppingCartItem.fromJson(Map<String, dynamic> json) {
    return ShoppingCartItem(
      id: json['id'],
      count: json['count'],
      price: json['price'],
      totalPrice: json['totalPrice'],
      userId: json['userId'],
      name: json['name'],
      title: json['title'],
      content: json['content'],
      mainPhoto: json['mainphoto'], // JSON 키 수정
      brandName: json['brandName'],
    );
  }
}

class CartModel {
  final List<ShoppingCartItem> items; // 장바구니 아이템 목록
  final int totalPrice; // 총 가격
  final bool isEmpty; // 장바구니 비어있는지 여부

  CartModel({
    required this.items,
    required this.totalPrice,
    required this.isEmpty,
  });

  // 체크된 아이템의 총 가격 계산
  int get checkedTotalPrice {
    return items.fold(0, (sum, item) => sum + (item.isChecked ? item.totalPrice : 0));
  }
}

class CartVm extends StateNotifier<CartModel?> {
  CartVm(super.state);


  Future<void> notifyInit() async {
    // 1. 통신을 해서 응답 받기
    List<dynamic> list = await CartRepository().findAll();
    Logger().d(list);
    List<ShoppingCartItem> items = list.map((itemJson) {
      return ShoppingCartItem.fromJson(itemJson);
    }).toList();

    int totalPrice = items.fold(0, (sum, item) => sum + item.totalPrice);
    bool isEmpty = items.isEmpty;
    Logger().d(items);

    // 2. 상태 갱신
    state = CartModel(
      items: items,
      totalPrice: totalPrice,
      isEmpty: isEmpty,
    );
  }

  void toggleItemCheck(int index) {
    if (state != null) {
      final item = state!.items[index];
      item.isChecked = !item.isChecked; // 체크 상태 토글
      state = CartModel(
        items: List.from(state!.items), // 새로운 리스트로 상태 갱신
        totalPrice: state!.totalPrice,
        isEmpty: state!.items.isEmpty,
      );
    }
  }

  void selectAll(bool isSelected) {
    if (state != null) {
      for (var item in state!.items) {
        item.isChecked = isSelected; // 전체 선택/해제
      }
      state = CartModel(
        items: List.from(state!.items), // 새로운 리스트로 상태 갱신
        totalPrice: state!.totalPrice,
        isEmpty: state!.items.isEmpty,
      );
    }
  }
  void updateCartModel() {
    if (state != null) {
      int totalPrice = state!.items.fold(0, (sum, item) => sum + item.totalPrice);
      bool isEmpty = state!.items.isEmpty;

      state = CartModel(
        items: List.from(state!.items), // 새 리스트로 상태 갱신
        totalPrice: totalPrice,
        isEmpty: isEmpty,
      );
    }
  }
}

// Provider 설정
final cartProvider = StateNotifierProvider.autoDispose<CartVm, CartModel?>((ref) {
  return CartVm(null)..notifyInit();
});
