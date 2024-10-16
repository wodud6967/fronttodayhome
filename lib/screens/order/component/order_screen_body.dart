import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/order/component/order_screen_appbar.dart';
import 'package:fronttodayhome/screens/order/component/order_screen_destination.dart';
import 'package:fronttodayhome/screens/order/component/order_screen_products.dart';
import 'package:fronttodayhome/screens/order/order_vm.dart';

import 'order_screen_orderer.dart';
import 'order_screen_total_price.dart';

class OrderScreenBody extends StatelessWidget {
  final OrderModel order;

  OrderScreenBody(this.order);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OrderScreenAppbar(),
        Container(height: 10, color: Colors.black12),
        OrderScreenDestination(order),
        OrderScreenOrderer(order),
        OrderScreenProducts(order),
        OrderScreenTotalPrice(order),
      ],
    );
  }
}
