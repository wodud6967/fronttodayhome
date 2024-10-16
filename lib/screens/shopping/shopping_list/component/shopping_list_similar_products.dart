import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/product_detail/product_detail_screen.dart';
import 'package:fronttodayhome/screens/shopping/shopping_list/shopping_list_vm.dart';
import 'Shopping_list_product_event.dart';

class ShoppingListSimilarProducts extends StatelessWidget {
  final List<Product> model;
  final int categoryId; // 추가: categoryId를 받음

  ShoppingListSimilarProducts(this.model, this.categoryId);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mTitle(categoryId: categoryId, productId: model.isNotEmpty ? model[0].id : 0),
        Products(model, categoryId),
        Container(height: 15, color: Colors.black12),
      ],
    );
  }
}

class Products extends StatelessWidget {
  final List<Product> model;
  final int categoryId; // 추가: categoryId를 받음

  Products(this.model, this.categoryId);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: model.map((post) {
            return _Product(post, categoryId); // 각 post와 categoryId를 전달
          }).toList(),
        ),
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
                    child: Image.network(product.mainPhoto,
                        fit: BoxFit.cover),
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

class ProductSample extends StatelessWidget {
  final int categoryId; // 추가: categoryId를 받음
  final int productId; // 추가: productId를 받음

  ProductSample(this.categoryId, this.productId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              productId: productId,
              categoryId: categoryId,
            ),
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
                "수정",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
              ),
              Text(
                "수정",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class mTitle extends StatelessWidget {
  final int categoryId; // 추가: categoryId를 받음
  final int productId; // 추가: productId를 받음

  mTitle({required this.categoryId, required this.productId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              productId: productId,
              categoryId: categoryId,
            ),
          ),
        );
      },
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
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