import 'package:flutter/material.dart';

class CategoryAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 45,
          child: Stack(
            children: [
              Center(child: Text("카테고리", style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),)),
              Positioned(top: 11,child: Icon(Icons.arrow_back,size: 25,)),
            ],
          ),
        ),
      ),
    );
  }
}
