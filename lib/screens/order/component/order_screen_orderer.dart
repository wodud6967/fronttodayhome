import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/order/order_vm.dart';

class OrderScreenOrderer extends StatefulWidget {
  final OrderModel order;
  OrderScreenOrderer(this.order);



  @override
  State<OrderScreenOrderer> createState() => _OrderScreenOrdererState();
}

class _OrderScreenOrdererState extends State<OrderScreenOrderer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 10,color: Colors.black12),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 18,vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "주문자", // 요약 내용
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                  Spacer(),
                  Text("${widget.order.order.userName}  ${widget.order.order.phone}",style: TextStyle(color: Colors.black)),
                  SizedBox(width: 5),
                  Container(child: InkWell(onTap:(){
                    setState(() {
                      isExpanded = !isExpanded; // 버튼 클릭 시 확장 상태 토글
                    });
                  },child: Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down))),
                ],
              ),
              if (isExpanded) ...[ // 확장된 경우 상세 내용을 보여줌
                SizedBox(height: 8), // 상세 내용과 요약 사이의 간격
                Text(
                  "짜잔짜잔짜잔짜잔짜잔짜잔짜잔짜잔짜잔짜잔짜잔짜잔", // 상세 내용
                  style: TextStyle(fontSize: 14),
                ),
              ],
              SizedBox(height: 8), // 버튼과 텍스트 사이의 간격

            ],
          ),
        ),
      ],
    );
  }
}