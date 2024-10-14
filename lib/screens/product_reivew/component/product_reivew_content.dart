import 'package:flutter/material.dart';

class ProductReviewContent extends StatefulWidget {
  final Function(String) onContentChanged;

  ProductReviewContent({required this.onContentChanged});

  @override
  _ProductReviewContentState createState() => _ProductReviewContentState();
}

class _ProductReviewContentState extends State<ProductReviewContent> {
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "리뷰를 작성해주세요.",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _contentController,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: '이 상품을 사용하면서 느꼈던 장점과 단점을 솔직하게 알려주세요.',
            border: OutlineInputBorder(),
          ),
          onChanged: (text) {
            widget.onContentChanged(text); // 리뷰 내용이 변경될 때마다 전달
          },
        ),
        SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "${_contentController.text.length}자 | 최소 20자",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
