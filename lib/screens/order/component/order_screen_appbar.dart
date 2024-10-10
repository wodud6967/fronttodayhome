import 'package:flutter/material.dart';

class OrderScreenAppbar extends StatelessWidget {
  
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
              Center(child: Text("주문서", style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),)),
              Positioned(top: 11,child: InkWell(onTap:(){ Navigator.pop(context);}, child: Icon(Icons.close,size: 25,))),
            ],
          ),
        ),
      ),
    );
  }
}
