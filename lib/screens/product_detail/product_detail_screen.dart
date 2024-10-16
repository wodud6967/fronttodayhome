import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/screens/product_detail/component/product_datail_appbar.dart';
import 'package:fronttodayhome/screens/product_detail/component/product_detail_img.dart';
import 'package:fronttodayhome/screens/product_detail/component/product_detail_info.dart';
import 'package:fronttodayhome/screens/product_detail/component/product_detail_navibar.dart';
import 'package:fronttodayhome/screens/product_detail/component/product_detail_productinfo.dart';
import 'package:fronttodayhome/screens/product_detail/component/product_detail_reivew.dart';
import 'package:fronttodayhome/screens/shopping/shopping_list/component/shopping_list_similar_products.dart';

import '../shopping/shopping_list/shopping_list_vm.dart';

class ProductDetailScreen extends ConsumerWidget {
  final int productId;
  final int categoryId;

  ProductDetailScreen({required this.productId, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingListModel = ref.watch(shoppingListProvider(categoryId));

    if (shoppingListModel == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final Product product = shoppingListModel.recentPosts.firstWhere(
          (p) => p.id == productId,
      orElse: () => Product(
        id: 0,
        title: "기본 상품",
        content: "기본 상품 설명",
        price: 0,
        mainPhoto: "",
        createdAt: "",
        reviews: [],
      ),
    );

    // 예시: 필요한 데이터를 준비
    final List<Product> similarProducts = shoppingListModel.recentPosts;

    return Scaffold(
      body: ListView(
        children: [
          ProductDetailAppbar(product.title),
          ProductDetailImg(product: product),
          SizedBox(height: 20),
          ProductDetailInfo(product: product),
          SizedBox(height: 20),
          ShoppingListSimilarProducts(similarProducts, categoryId), // 수정된 부분
          SizedBox(height: 20),
          ProductDetailProductinfo(product: product),
          SizedBox(height: 20),
          ProductDetailReview(product: product),
        ],
      ),
      bottomNavigationBar: ProductDetailNavibar(product: product), // 여기서 product 전달
    );
  }
}