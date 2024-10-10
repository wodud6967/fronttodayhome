import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/order/component/order_screen_appbar.dart';
import 'package:fronttodayhome/screens/order/component/order_screen_destination.dart';
import 'package:fronttodayhome/screens/order/component/order_screen_products.dart';

import 'order_screen_orderer.dart';
import 'order_screen_payment.dart';
import 'order_screen_total_price.dart';

class OrderScreenBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OrderScreenAppbar(),
        Container(height: 10,color: Colors.black12),
        OrderScreenDestination(),
        OrderScreenOrderer(),
        OrderScreenProducts(),
        OrderScreenPayment(),
        OrderScreenTotalPrice(),



      ],
    );
  }
}
