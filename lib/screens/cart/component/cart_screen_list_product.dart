import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/cart/cart_vm.dart';

import 'cart_screen_product_count.dart';

class CartScreenListProduct extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final deliveryCharge;
  final ShoppingCartItem product;

  CartScreenListProduct({
    required this.isChecked,
    required this.onChanged,
    required this.deliveryCharge,
    required this.product// 필수 가격 파라미터 추가
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProductHeader(product),
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
        _ImageLine(deliveryCharge,product),
        CartScreenProductCount(product),
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
  final ShoppingCartItem product;
   _ImageLine(this.deliveryCharge, this.product);

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
              child: Image.network(product.mainPhoto,
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Column(
                children: [
                  Text(product.title,
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
  final ShoppingCartItem product;
  _ProductHeader(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black12))),
        height: 40,
        child: Center(
            child: Text(
          "${product.brandName} 배송",
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        )));
  }
}
