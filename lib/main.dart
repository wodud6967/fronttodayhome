import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/screens/cart/cart_screen.dart';
import 'package:fronttodayhome/screens/main_screens.dart';
import 'package:fronttodayhome/screens/my_page/my_page_screen.dart';
import 'package:fronttodayhome/theme.dart';

import 'screens/login/login_screen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(ProviderScope(child: TodayHome()));
}

class TodayHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/cart": (context) => CartScreen(),
        "/login": (context) => LoginScreen(),
        "/mypage": (context) => MyPageScreen(),
      },
      title: 'today_home_ui',
      debugShowCheckedModeBanner: false,
      home: MainScreens(),
      theme: theme(),
      navigatorKey: navigatorKey,
    );
  }
}
