import 'package:flutter/material.dart';

class ProductReviewAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close, size: 25, color: Colors.lightBlue),
      ),
      title: Text(
        "리뷰쓰기",
        style: TextStyle(
          fontSize: 20,
          color: Colors.lightBlue,
        ),
      ),
      centerTitle: true,
    );
  }
}
