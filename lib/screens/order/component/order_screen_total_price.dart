import 'package:flutter/material.dart';

class OrderScreenTotalPrice extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 10,color: Colors.black12),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("결제금액",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              PriceLine("총 상품금액", "", "310,000"),
              PriceLine("배송비", "+", "15,000"),
              PriceLine("쿠폰 사용", "-", "131,000"),
              PriceLine("포인트 사용", "-", "131,000"),
              SizedBox(height: 10),
              Divider(),
              Row(
                children: [
                  Text("최종 결제 금액",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text("249,000원",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 25,fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("249P 적립 예정",style: TextStyle(color: Colors.black)),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 370,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.lightBlueAccent,borderRadius: BorderRadius.circular(7)),
                  child: Center(child: Text("249,000원 결제하기",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16))),
                ),
              ),
            ],
          ),
        ),
      ],
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
