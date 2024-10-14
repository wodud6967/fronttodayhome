import 'package:flutter/material.dart';

import 'component/shopping_list_appbar.dart';
import 'component/shopping_list_banner.dart';
import 'component/shopping_list_filter.dart';
import 'component/shopping_list_products.dart';
import 'component/shopping_list_similar_products.dart';

class ShoppingListScreen extends StatelessWidget {
  final id;
  final name;
  ShoppingListScreen(this.id, this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ShoppingListAppbar("$name"),
          ShoppingListBanner(),
          ShoppingListSimilarProducts(),
          ShoppingListFilter(),
          ShoppingListProducts(),
        ],
      ),
    );
  }
}
