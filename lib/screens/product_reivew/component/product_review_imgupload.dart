import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductReviewImgupload extends StatefulWidget {
  final Function(String) onImageSelected;

  ProductReviewImgupload({required this.onImageSelected});

  @override
  _ProductReviewImguploadState createState() => _ProductReviewImguploadState();
}

class _ProductReviewImguploadState extends State<ProductReviewImgupload> {
  Uint8List? _imageBytes;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Uint8List imageBytes = await pickedFile.readAsBytes();
      String base64String = base64Encode(imageBytes);

      setState(() {
        _imageBytes = imageBytes;
      });

      widget.onImageSelected(base64String); // base64로 변환한 이미지 전달
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "사진 업로드 (선택)",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        _imageBytes != null
            ? Image.memory(_imageBytes!, width: 100, height: 100)
            : Container(
                height: 100,
                width: 100,
                color: Colors.grey[300],
                child: Icon(Icons.add_photo_alternate, size: 50),
              ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _pickImage,
          child: Text(
            "사진 업로드",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
        ),
      ],
    );
  }
}
