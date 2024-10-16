import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/screens/order/order_vm.dart';

class OrderScreenDestination extends StatefulWidget {
  final OrderModel order;
  OrderScreenDestination(this.order);

  @override
  State<OrderScreenDestination> createState() => _OrderScreenDestinationState();
}

class _OrderScreenDestinationState extends State<OrderScreenDestination> {

  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("배송지",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Spacer(),
              Text("변경",
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 15),
          Text("${widget.order.order.userName}", style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
          SizedBox(height: 7),
          Text("${widget.order.order.address}",
              style: TextStyle(color: Colors.black)),
          SizedBox(height: 7),
          Text("${widget.order.order.userName} ${widget.order.order.phone}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: checked,
                fillColor: WidgetStatePropertyAll(Colors.lightBlueAccent),
                side: BorderSide(color: Colors.white),
                onChanged: (bool? value) {
                  setState(() {
                    checked = value!; // 상태 업데이트
                  });
                },
              ),Text("기본 배송지로 저장"),

            ],
          ),
          TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),hintText: "배송 전에 미리 연락 바랍니다."),),
        ],
      ),
    );
  }
}
