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
  ShoppingListScreen(this.id, this.name);

  @override
  Widget build(BuildContext context,ref) {
    ShoppingListModel? model = ref.watch(shoppingListProvider(id));
    if (model == null) {
      return CircularProgressIndicator();
    } else {
      return Scaffold(
        body: ListView(
          children: [
            ShoppingListAppbar("$name"),
            ShoppingListBanner(),
            ShoppingListSimilarProducts(model.recentPosts),
            ShoppingListFilter(),
            ShoppingListProducts(model.pageTotalSold),
          ],
        ),
      );
    }
  }
}
