import 'package:flutter/material.dart';

import 'cart_screen_list_product.dart';

class CartScreenList extends StatefulWidget {
  @override
  State<CartScreenList> createState() => _CartScreenListState();
}

class _CartScreenListState extends State<CartScreenList> {
  bool isAllChecked = false;
  bool isChecked = false;
  List<bool> isCheckedList = [false, false,false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckAllBar(),
        SizedBox(
          height: 590,
          child: ListView(
            children: [
              CartScreenListProduct(
                  deliveryCharge: "15000",
                  isChecked: isCheckedList[0],
                  onChanged: (bool? value) {
                    setState(() {
                      isCheckedList[0] = value!;
                    });
                  }),
              CartScreenListProduct(
                  deliveryCharge: "15000",
                  isChecked: isCheckedList[1],
                  onChanged: (bool? value) {
                    setState(() {
                      isCheckedList[1] = value!;
                    });
                  }),
              CartScreenListProduct(
                  deliveryCharge: "15000",
                  isChecked: isCheckedList[2],
                  onChanged: (bool? value) {
                    setState(() {
                      isCheckedList[2] = value!;
                    });
                  }),
              Price(),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 7,left: 15),
              child: Text("1개 194,000원"),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45,
                                decoration: BoxDecoration(color: Colors.lightBlueAccent,borderRadius: BorderRadius.circular(7)),
                                child: Center(child: Text("바로구매",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                              ),
                )),
          ],
        ),
      ],
    );
  }

  Column CheckAllBar() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _mCheckbox(isAllChecked, (bool? value) {
              setState(() {
                isAllChecked = value!;
                isCheckedList = List.generate(isCheckedList.length, (index) => isAllChecked);
              });
            }),
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

  Checkbox _mCheckbox(bool isChecked, ValueChanged<bool?> onChanged) {
    return Checkbox(
      fillColor: WidgetStatePropertyAll(Colors.lightBlueAccent),
      side: BorderSide(color: Colors.white),
      value: isChecked,
      onChanged: onChanged, // 여기서 전달받은 onChanged 콜백을 사용
    );
  }
}

class Price extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          PriceLine("총 상품금액", "", "310,000"),
          PriceLine("총 배송비", "+", "15,000"),
          PriceLine("총 할인금액", "-", "131,000"),
          TotalPrice("194,000"),
        ],
      ),
    );
  }
}

class TotalPrice extends StatelessWidget {
  final price;

  const TotalPrice(this.price);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Text("결제금액",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Spacer(),
          Text("$price",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          Text("원",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ],
      ),
    );
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
