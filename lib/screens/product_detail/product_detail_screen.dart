import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/product_detail/component/product_datail_appbar.dart';
import 'package:fronttodayhome/screens/product_detail/component/product_detail_img.dart';
import 'package:fronttodayhome/screens/product_detail/component/product_detail_info.dart';
import 'package:fronttodayhome/screens/product_detail/component/product_detail_list_similar.dart';
import 'package:fronttodayhome/screens/product_detail/component/product_detail_navibar.dart';
import 'package:fronttodayhome/screens/product_detail/component/product_detail_productinfo.dart';
import 'package:fronttodayhome/screens/product_detail/component/product_detail_reivew.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ProductDetailAppbar("침대 이름"),
          ProductDetailImg(),
          SizedBox(height: 20),
          ProductDetailInfo(),
          SizedBox(height: 20),
          ProductDetailListSimilar(),
          SizedBox(height: 20),
          ProductDetailProductinfo(),
          SizedBox(height: 20),
          ProductDetailReview(),
        ],
      ),
      bottomNavigationBar: ProductDetailNavibar(),
    );
  }
}

