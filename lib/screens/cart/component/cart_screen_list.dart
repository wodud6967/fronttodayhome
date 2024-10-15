import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/screens/cart/cart_vm.dart';
import 'package:fronttodayhome/screens/order/component/order_screen_total_price.dart';
import 'cart_screen_list_product.dart';

class CartScreenList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartModel = ref.watch(cartProvider);

    // 모델이 null인 경우 로딩 인디케이터 표시
    if (cartModel == null) {
      return Center(child: CircularProgressIndicator());
    }

    // 장바구니가 비어 있는 경우 메시지 표시
    if (cartModel.isEmpty) {
      return Center(child: Text("장바구니가 비어있습니다."));
    } else {
      return Column(
        children: [
          CheckAllBar(cartModel.items, ref), // 전체 선택 바
          SizedBox(
            height: 590,
            child: ListView.builder(
              itemCount: cartModel.items.length,
              itemBuilder: (context, index) {
                final item = cartModel.items[index];
                return CartScreenListProduct(
                  product:item,
                  deliveryCharge: "0",
                  isChecked: item.isChecked, // 각 아이템의 체크 상태
                  onChanged: (bool? value) {
                    item.isChecked = value ?? false; // 체크 상태 업데이트
                    ref.read(cartProvider.notifier)
                        .updateCartModel(); // 모델 업데이트
                  },
                );
              },
            ),
          ),
          Price(cartModel.items),
          BottomBar(cartModel.items),
        ],
      );
    }
  }

  // 전체 선택 체크박스와 관련된 UI 구성
  Widget CheckAllBar(List<ShoppingCartItem> items, WidgetRef ref) {
    bool isAllChecked = items.every((item) => item.isChecked);

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              fillColor: WidgetStatePropertyAll(Colors.lightBlueAccent),
              value: isAllChecked,
              onChanged: (bool? value) {
                // 전체 선택/해제 처리
                for (var item in items) {
                  item.isChecked = value ?? false;
                }
                ref.read(cartProvider.notifier).updateCartModel(); // 모델 업데이트
              },
            ),
            Text("모두선택"),
            Spacer(),
            Text("선택삭제", style: TextStyle(fontSize: 12)),
            SizedBox(width: 16),
          ],
        ),
        Container(height: 15, color: Colors.black12),
      ],
    );
  }
}

// 장바구니 하단에 표시되는 UI 구성
class BottomBar extends StatelessWidget {
  final List<ShoppingCartItem> items;

  BottomBar(this.items);

  @override
  Widget build(BuildContext context) {
    final selectedItems = items.where((item) => item.isChecked).toList(); // 체크된 아이템만 추출
    final selectedCount = selectedItems.length; // 체크된 아이템 수
    final totalPrice = selectedItems.fold(0, (sum, item) => sum + item.totalPrice); // 총 금액 계산

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 7, left: 15),
          child: SizedBox(
            width: 100,
            child: Text(
              "$selectedCount개 ${totalPrice}원", // 체크된 아이템 수와 총 금액 표시
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // 선택된 아이템만 추려서 구매하기로 이동
                Navigator.pushNamed(context, "/order", arguments: selectedItems);
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    "바로구매",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Price extends StatelessWidget {
  final List<ShoppingCartItem> items; // 체크된 아이템 리스트

  const Price(this.items);

  @override
  Widget build(BuildContext context) {
    final selectedItems = items.where((item) => item.isChecked).toList(); // 체크된 아이템만 추출
    final totalPrice = selectedItems.fold(0, (sum, item) => sum + item.totalPrice); // 총 상품 금액 계산

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          PriceLine("총 상품금액", "", "${totalPrice}"), // 총 상품 금액 표시
          TotalPrice("${totalPrice}"), // 할인된 총 결제 금액 표시
        ],
      ),
    );
  }
}
class TotalPrice extends StatelessWidget {
  final String totalPrice;

  const TotalPrice(this.totalPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "총 결제 금액",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "$totalPrice 원",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.red, // 강조 색상
            ),
          ),
        ],
      ),
    );
  }
}