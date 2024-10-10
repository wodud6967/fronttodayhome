import 'package:flutter/material.dart';

import 'cart_screen_appbar.dart';
import 'cart_screen_list.dart';

class CartScreenBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(

      children: [
        CartScreenAppbar(),
        CartScreenList(),


      ],
    );
  }
}
