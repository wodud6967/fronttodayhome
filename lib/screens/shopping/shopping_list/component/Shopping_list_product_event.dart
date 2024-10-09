import 'package:flutter/material.dart';

class ShoppingListProductEvent extends StatelessWidget {

  final name;
  final backColor;
  final fontColor;

  ShoppingListProductEvent(this.name, this.fontColor, this.backColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, right: 3),
      child: Container(
          decoration: BoxDecoration(
              color: backColor, borderRadius: BorderRadius.circular(3)),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text(" $name ",
                style: TextStyle(fontSize: 11, color: fontColor)),
          )),
    );
  }
}
