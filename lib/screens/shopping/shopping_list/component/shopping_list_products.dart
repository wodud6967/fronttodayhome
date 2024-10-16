import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/shopping/shopping_list/shopping_list_vm.dart';

import '../../../product_detail/product_detail_screen.dart';
import 'Shopping_list_product_event.dart';

class ShoppingListProducts extends StatelessWidget {
  final List<Product> model;
  final int categoryId;

  ShoppingListProducts(this.model, this.categoryId);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ProductsHeader(),
          ProductsOption(),
          Wrap(
            children: model.map((post) {
              return _Product(post, categoryId); // 각 post와 categoryId 전달
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _Product extends StatelessWidget {
  final Product product;
  final int categoryId; // 추가: categoryId를 받음

  _Product(this.product, this.categoryId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              productId: product.id, // productId 전달
              categoryId: categoryId, // categoryId 전달
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
                  )),
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

class ProductsOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: SizedBox(
        height: 30,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ProductsOptionButton("빠른배송가구"),
            ProductsOptionButton("슈퍼싱글(SS)"),
            ProductsOptionButton("로켓배송"),
            ProductsOptionButton("SSG배송"),
            ProductsOptionButton("당일배송"),
            ProductsOptionButton("특급배송"),
          ],
        ),
      ),
    );
  }
}

class ProductsOptionButton extends StatelessWidget {
  final name;

  ProductsOptionButton(this.name);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: SizedBox(
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                  child: Row(
                    children: [
                      Icon(Icons.check, size: 15),
                      SizedBox(width: 5),
                      Text(
                        "$name",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )),
            )),
      ),
    );
  }
}

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Text("전체"),
          Text("21,688"),
          Spacer(),
          Text("인기순"),
          SizedBox(width: 5),
          Container(
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(5)),
            width: 55,
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.filter_alt_sharp, size: 15, color: Colors.white),
                Text(" 필터",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}