import 'package:flutter/material.dart';
import '../../shopping/shopping_list/shopping_list_vm.dart';


class ProductDetailProductinfo extends StatefulWidget {
  final Product product; // Product 객체 추가

  ProductDetailProductinfo({required this.product}); // 생성자 수정

  @override
  _ProductDetailProductinfoState createState() =>
      _ProductDetailProductinfoState();
}

class _ProductDetailProductinfoState extends State<ProductDetailProductinfo> {
  // 펼치기 여부를 관리할 변수
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "상품정보",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),

        // 상품 정보가 나오는 위젯 (펼쳐지지 않았을 때만 PageView 표시)
        if (!_isExpanded)
          _productinfoImg(infoimageUrls: _getProductImages()), // 수정된 부분
        SizedBox(height: 20),

        // 펼치기 버튼 (펼쳐지지 않았을 때만 보임)
        if (!_isExpanded)
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isExpanded = true;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent, // 버튼 배경색
              padding: EdgeInsets.symmetric(vertical: 16), // 버튼 내부 패딩
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // 둥근 모서리
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "펼치기",
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),

        // 사진을 밑으로 진열하는 부분 (펼쳐진 경우)
        if (_isExpanded)
          Column(
            children: [
              _expandedImages(_getProductImages()), // 수정된 부분
              SizedBox(height: 20),
              // 접기 버튼을 이미지 아래에 배치
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent, // 버튼 배경색
                  padding: EdgeInsets.symmetric(vertical: 16), // 버튼 내부 패딩
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // 둥근 모서리
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "접기",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }

  // Product 객체를 사용하여 이미지 URL 리스트 가져오기
  List<String> _getProductImages() {
    // 예시로 주어진 product.mainPhoto를 여러 이미지 URL로 변환하거나 사용
    return [
      widget.product.mainPhoto, // 실제 제품의 mainPhoto를 사용
      'https://picsum.photos/600/400?image=1',
      'https://picsum.photos/600/400?image=2',
    ];
  }

  // 초기 이미지 슬라이드 (펼쳐지지 않았을 때만 보임)
  Widget _productinfoImg({required List<String> infoimageUrls}) {
    return Container(
      height: 300,
      child: PageView.builder(
        itemCount: infoimageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                infoimageUrls[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  // 펼쳐졌을 때 이미지 목록을 밑으로 진열하는 부분
  Widget _expandedImages(List<String> infoimageUrls) {
    return Column(
      children: infoimageUrls.map((url) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              url,
              fit: BoxFit.cover,
              height: 200, // 원하는 높이 설정
            ),
          ),
        );
      }).toList(),
    );
  }
}