import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/main_screens.dart';
import 'package:fronttodayhome/theme.dart';


void main() {
  runApp( CarrotMarketUI());
}

class CarrotMarketUI extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'carrot_market_ui',
      debugShowCheckedModeBanner: false,
      home: MainScreens(),
      theme: theme(),
    );
  }
}
