import 'package:flutter/material.dart';

class ProductDetailInfo extends StatelessWidget {
  const ProductDetailInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return _detailinfoWihet();
  }
}

class _detailinfoWihet extends StatelessWidget {
  const _detailinfoWihet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "퍼니코",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "원단샘플 빈 아쿠아 텍스 패브릭/부클레 호텔 침대프레임(SS/Q/K/LK/CK)",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  maxLines: 2, //최대 2줄로 설정
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: Icon(Icons.share_outlined, size: 20, color: Colors.grey),
                onPressed: () {
                  print("공유버튼 눌러짐");
                },
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, size: 18, color: Colors.lightBlue),
              Icon(Icons.star, size: 18, color: Colors.lightBlue),
              Icon(Icons.star, size: 18, color: Colors.lightBlue),
              Icon(Icons.star, size: 18, color: Colors.lightBlue),
              Icon(Icons.star_half_rounded, size: 18, color: Colors.lightBlue),
              SizedBox(width: 4),
              Text(
                "(2,236)",
                style: TextStyle(fontSize: 14, color: Colors.lightBlue),
              ),
            ],
          ),
          SizedBox(width: 4),
          Row(
            children: [
              Text(
                "249,000원",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(width: 4),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  "특가",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
