import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/home/component/home_login.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return ListView(
       children: [
         HomeLogin(),
       ],
     );
  }
}
