import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/screens/cart/cart_screen.dart';
import 'package:fronttodayhome/screens/main_screens.dart';
import 'package:fronttodayhome/screens/order/order_screen.dart';
import 'package:fronttodayhome/screens/shopping/shopping_list/shopping_list_screen.dart';
import 'package:fronttodayhome/theme.dart';



void main() {
  runApp(ProviderScope(child: TodayHome()));
}

class TodayHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/cart" : (context) => CartScreen(),
        "/shoppinglist" : (context) => ShoppingListScreen(),
        "/order" : (context) => OrderScreen(),
      },
      title: 'today_home_ui',
      debugShowCheckedModeBanner: false,
      home: MainScreens(),
      theme: theme(),
    );
  }
}
