import 'package:flutter/material.dart';

import 'cart_screen_product_count.dart';

class CartScreenListProduct extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final deliveryCharge;

  CartScreenListProduct(
      {required this.isChecked, required this.onChanged,required this.deliveryCharge});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProductHeader(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _mCheckbox(isChecked, onChanged),
            _NextCheckBox(),
            Spacer(),
            Icon(Icons.close),
            SizedBox(width: 16),
          ],
        ),
        _ImageLine(deliveryCharge),
        CartScreenProductCount(),
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("배송비 ", style: TextStyle(color: Colors.black)),
              Text(deliveryCharge, style: TextStyle(color: Colors.black)),
              Text("원", style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        Container(
          height: 10,
          decoration: BoxDecoration(color: Colors.black12),
        ),
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

class _NextCheckBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        children: [
          Text("  "),
          Text(
            "오늘출발 마감",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(width: 3),
          Container(
            height: 13,
            child: VerticalDivider(
              color: Colors.black26,
              thickness: 1,
            ),
          ),
          Text("10/8(화) 발송예정",
              style: TextStyle(color: Colors.lightBlueAccent)),
          Text("  "),
        ],
      ),
    );
  }
}

class _ImageLine extends StatelessWidget {
  final deliveryCharge;
   _ImageLine(this.deliveryCharge);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 340,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network("https://picsum.photos/id/200/200/300",
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Column(
                children: [
                  Text("[우드띠어리] 포니 체어 인테리어 거실 라운지 디자인체어 인형 스툴 4collors",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("배송비 $deliveryCharge원", style: TextStyle(fontSize: 12)),
                      Container(
                        height: 11,
                        child: VerticalDivider(
                          color: Colors.black26,
                          thickness: 1,
                        ),
                      ),
                      Text("일반택배", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductHeader extends StatelessWidget {
  const _ProductHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black12))),
        height: 40,
        child: Center(
            child: Text(
          "우드띠어리 배송",
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        )));
  }
}
