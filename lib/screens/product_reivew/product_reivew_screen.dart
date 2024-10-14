import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/product_reivew/component/product_reivew_content.dart';
import 'package:fronttodayhome/screens/product_reivew/component/product_review_appbar.dart';
import 'package:fronttodayhome/screens/product_reivew/component/product_review_imgupload.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  @override
  _ProductReviewScreenState createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  String? _base64Image;
  String? _reviewContent;

  void _handleImageSelected(String base64Image) {
    setState(() {
      _base64Image = base64Image;
    });
  }

  void _handleContentChanged(String content) {
    setState(() {
      _reviewContent = content;
    });
  }

  void _handleSubmit() {
    if (_reviewContent != null && _reviewContent!.length >= 20) {
      // 이미지 업로드가 선택되지 않았을 때에도 리뷰만 저장 가능하도록 수정
      print('리뷰 내용: $_reviewContent');

      if (_base64Image != null) {
        print('이미지 (Base64): $_base64Image');
      } else {
        print('이미지 없음');
      }

      // 이곳에 서버로 전송하는 로직 추가 (리뷰 내용과 이미지를 서버로 전송)
    } else {
      // 경고 메시지 표시
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("리뷰는 최소 20자 이상 작성해야 합니다.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: ProductReviewAppbar(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ProductReviewImgupload(onImageSelected: _handleImageSelected),
          SizedBox(height: 20),
          ProductReviewContent(onContentChanged: _handleContentChanged),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _handleSubmit,
            child: Text(
              "저장하기",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              minimumSize: Size(double.infinity, 50), // 버튼 크기
            ),
          ),
        ],
      ),
    );
  }
}
