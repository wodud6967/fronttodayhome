import 'package:flutter/material.dart';

import 'component/category_appbar.dart';
import 'component/category_categorylist.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CategoryAppbar(),
        CategoryCategoryList(),
      ],
    );
  }
}
