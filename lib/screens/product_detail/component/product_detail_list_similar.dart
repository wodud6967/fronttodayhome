import 'package:flutter/material.dart';

import '../../shopping/shopping_list/component/shopping_list_similar_products.dart';
import '../product_detail_screen.dart';

class ProductDetailListSimilar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mTitle(),
        Products(),
        Container(height: 15, color: Colors.black12),
      ],
    );
  }
}

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (int i = 0; i < 20; i++) ProductSample(),
          ],
        ),
      ),
    );
  }
}


class mTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print('Title tapped!');  // 로그 출력
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailScreen()),
        );
      },
      child: Container(
        color: Colors.transparent, // 터치 영역을 명확하게 하기 위해 색상 추가
        width: double.infinity,    // 터치 가능한 영역 확장
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                "함께 보면 좋을 상품",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Container(
                width: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: Text(
                      "AD",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
