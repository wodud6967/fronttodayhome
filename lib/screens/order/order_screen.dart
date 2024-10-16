import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/screens/order/order_vm.dart';

import 'component/order_screen_body.dart';

class OrderScreen extends ConsumerWidget {
  final Map<String, dynamic> Order;

  OrderScreen(this.Order);

  @override
  Widget build(BuildContext context, ref) {
    OrderModel? order = ref.watch(orderProviderInit(Order));
    if (order == null) {
      return CircularProgressIndicator();
    } else {
      return Scaffold(
        body: OrderScreenBody(order),
      );
    }
  }
}
