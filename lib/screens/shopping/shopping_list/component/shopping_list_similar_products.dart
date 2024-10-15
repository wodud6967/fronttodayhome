import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/product_detail/product_detail_screen.dart';


import 'Shopping_list_product_event.dart';


class ShoppingListSimilarProducts extends StatelessWidget {
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

class ProductSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(), // 상세보기 페이지로 이동
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: SizedBox(
          width: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.network("https://picsum.photos/id/200/200/300",
                        fit: BoxFit.cover),
                  )),
              const SizedBox(height: 5),
              Text(
                "에이스침대",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
              ),
              Text(
                "가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Text("53%",
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Text("764.000",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star, size: 16, color: Colors.lightBlueAccent),
                  Text("4.7",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                  const SizedBox(width: 5),
                  Text("리뷰", style: TextStyle(fontSize: 12)),
                  const SizedBox(width: 5),
                  Text("30217", style: TextStyle(fontSize: 12)),
                ],
              ),
              Row(
                children: [
                  ShoppingListProductEvent("특가", Colors.white, Colors.redAccent),
                  ShoppingListProductEvent("무료배송", Colors.black, Colors.black12),
                ],
              ),
            ],
          ),
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