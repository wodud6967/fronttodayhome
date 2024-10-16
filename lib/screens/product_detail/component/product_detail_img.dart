import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/product_detail/product_detail_vm.dart';

import '../../shopping/shopping_list/shopping_list_vm.dart';

class ProductDetailImg extends StatelessWidget {
  final Product product;

  ProductDetailImg({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.mainPhoto, // 단일 이미지 표시
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 10),
            Text(
              "가구 > 침대 > 침대프레임 > 일반침대",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
