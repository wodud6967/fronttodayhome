import 'package:flutter/material.dart';

class CartScreenProductCount extends StatefulWidget {
  @override
  State<CartScreenProductCount> createState() => _CartScreenProductCountState();
}

class _CartScreenProductCountState extends State<CartScreenProductCount> {
  int _count = 1;
  int _price = 179000;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      if (_count > 0) _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              width: 340,
              decoration: BoxDecoration(
                  color: Colors.black12, borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("부클 스틸 블루", style: TextStyle(color: Colors.black)),
                        Spacer(),
                        Icon(Icons.close),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
                                children: [
                                  _Button("-", _decrement),
                                  SizedBox(width: 20), // 버튼과 숫자 사이의 간격
                                  Text(
                                    '$_count',
                                    style: TextStyle(color: Colors.black), // 숫자 크기 조절
                                  ),
                                  SizedBox(width: 20), // 숫자와 버튼 사이의 간격
                                  _Button("+", _increment),
                                ],
                              ),
                              Spacer(),
                              Text(
                                "${_count * _price}",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text("원", style: TextStyle(color: Colors.black)),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("옵션변경"),
                  Container(
                    height: 13,
                    child: VerticalDivider(
                      color: Colors.black26,
                      thickness: 1,
                    ),
                  ),
                  Text("바로구매"),
                  Spacer(),
                  Text(
                    "${_count * _price}",
                    style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  Text("원", style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}

class _Button extends StatelessWidget {
  final name;
  final onPressed;

  _Button(this.name, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 20,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(7)),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          child: Center(child: Text("$name")),
        ),
      ),
    );
  }
}
