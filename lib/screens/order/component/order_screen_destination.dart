import 'package:flutter/material.dart';

class OrderScreenDestination extends StatefulWidget {
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
          Text("수민집", style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
          SizedBox(height: 7),
          Text("부산 강서구 신호산단1로 140번길 0-00 (신호동), 베타빌 401호",
              style: TextStyle(color: Colors.black)),
          SizedBox(height: 7),
          Text("정수민 010-0000-0000"),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: checked,
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
