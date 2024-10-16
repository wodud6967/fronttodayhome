import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/home/component/logined_home.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return ListView(
       children: [
         LoginedHome(),
       ],
     );
  }
}
