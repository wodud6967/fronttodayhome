import 'package:flutter/material.dart';

class ProductDetailReivew extends StatelessWidget {
  const ProductDetailReivew({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        Text(
          "리뷰",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "4.7",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Icon(Icons.star, size: 20, color: Colors.lightBlue),
            Icon(Icons.star, size: 20, color: Colors.lightBlue),
            Icon(Icons.star, size: 20, color: Colors.lightBlue),
            Icon(Icons.star, size: 20, color: Colors.lightBlue),
            Icon(Icons.star_half, size: 20, color: Colors.lightBlue),
          ],
        ),
      ],
    );
  }
}
