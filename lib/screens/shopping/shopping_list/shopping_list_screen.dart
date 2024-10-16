import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/screens/shopping/shopping_list/shopping_list_vm.dart';
import 'package:logger/logger.dart';

import 'component/shopping_list_appbar.dart';
import 'component/shopping_list_banner.dart';
import 'component/shopping_list_filter.dart';
import 'component/shopping_list_products.dart';
import 'component/shopping_list_similar_products.dart';

class ShoppingListScreen extends ConsumerWidget {
  final id;
  final name;
  final categoryName;
  ShoppingListScreen(this.id, this.name, this.categoryName);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ShoppingListModel? model = ref.watch(shoppingListProvider(id));
    if (model == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        body: ListView(
          children: [
            ShoppingListAppbar("$name"),
            ShoppingListBanner(name,categoryName),
            ShoppingListSimilarProducts(model.recentPosts, id), // 수정된 부분
            ShoppingListFilter(),
            ShoppingListProducts(model.pageTotalSold, id), // 수정된 부분
          ],
        ),
      );
    }
  }
}