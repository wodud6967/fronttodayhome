import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/screens/order/order_vm.dart';

import '../../../payment/kakaopay_vm.dart';

class OrderScreenTotalPrice extends ConsumerWidget {
  final OrderModel order;

  OrderScreenTotalPrice(this.order);

  int calculateTotalPrice() {
    return order.orderDetails.fold(0, (sum, item) => sum + item.totalPrice);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? nextUrl =
        ref.watch(KaKaoPayProvider(order.order.orderId)); // URL 가져오기
    int totalPrice = calculateTotalPrice();
    if (nextUrl == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Column(
        children: [
          Container(height: 10, color: Colors.black12),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("결제금액",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                PriceLine("총 상품금액", "", "$totalPrice"),
                PriceLine("배송비", "+", "0"),
                PriceLine("쿠폰 사용", "-", "0"),
                PriceLine("포인트 사용", "-", "0"),
                SizedBox(height: 10),
                Divider(),
                Row(
                  children: [
                    Text("최종 결제 금액",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("$totalPrice원",
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("249P 적립 예정", style: TextStyle(color: Colors.black)),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: InkWell(
                    onTap: () async {
                      AndroidIntent intent = AndroidIntent(
                        action: 'action_view',
                        data: nextUrl,
                      );
                      await intent.launch();

                      print("결재완료 됨");
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/mypage", (route) => true);
                    },
                    child: Container(
                      width: 370,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(7)),
                      child: Center(
                          child: Text("$totalPrice원 결제하기",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}

class PriceLine extends StatelessWidget {
  final name;
  final price;
  final Symbol;

  PriceLine(this.name, this.Symbol, this.price);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Text("$name", style: TextStyle(color: Colors.black)),
          Spacer(),
          Text("$Symbol ",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
          Text("$price",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
          Text("원", style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
