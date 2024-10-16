import 'package:flutter/material.dart';

import '../../shopping/shopping_list/shopping_list_vm.dart';

class ProductDetailInfo extends StatelessWidget {
  final Product product;

  ProductDetailInfo({required this.product});

  @override
  Widget build(BuildContext context) {
    return _DetailInfoWidget(product: product);
  }
}

class _DetailInfoWidget extends StatelessWidget {
  final Product product;

  _DetailInfoWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 브랜드명 (예시로 "퍼니코"를 사용했지만 실제 데이터로 대체)
          Text(
            "시몬스", // 이 부분은 하드코딩된 데이터로 남겨둠
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  product.title, // 상품의 제목 표시
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: Icon(Icons.share_outlined, size: 20, color: Colors.grey),
                onPressed: () {
                  print("공유버튼 눌러짐");
                },
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, size: 18, color: Colors.lightBlue),
              Icon(Icons.star, size: 18, color: Colors.lightBlue),
              Icon(Icons.star, size: 18, color: Colors.lightBlue),
              Icon(Icons.star, size: 18, color: Colors.lightBlue),
              Icon(Icons.star_half_rounded, size: 18, color: Colors.lightBlue),
              SizedBox(width: 4),
              Text(
                "(${product.reviews.length})", // 리뷰 개수로 표시
                style: TextStyle(fontSize: 14, color: Colors.lightBlue),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                "${product.price}원", // 상품의 가격 표시
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(width: 4),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  "특가", // 특가 라벨
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}