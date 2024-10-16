import 'package:flutter/material.dart';

import '../../shopping/shopping_list/component/Shopping_list_product_event.dart';
import '../../shopping/shopping_list/shopping_list_vm.dart';
import '../product_detail_screen.dart';

class _Product extends StatelessWidget {
  final Product product;
  final int? categoryId; // Optional로 변경하여 사용

  _Product(this.product, [this.categoryId]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              productId: product.id,
              categoryId: categoryId ?? 0, // 전달된 경우 사용하고, 없으면 기본값 0 사용
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.network(
                    product.mainPhoto,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                product.title,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
              ),
              Text(
                product.content,
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
                  Text("${product.price}",
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
                  Text("${product.reviews.length}", style: TextStyle(fontSize: 12)),
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