import 'package:flutter/material.dart';

class ProductDetailNavibar extends StatefulWidget {
  const ProductDetailNavibar({super.key});

  @override
  _ProductDetailNavibarState createState() => _ProductDetailNavibarState();
}

class _ProductDetailNavibarState extends State<ProductDetailNavibar> {
  String selectedSize = "SS";
  String selectedColor = "Green";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // 패딩 추가
      height: 80, // NAVIBAR의 높이 설정
      decoration: BoxDecoration(
        border:
        Border(top: BorderSide(color: Colors.grey, width: 0.5)), // 상단 경계선
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 아이콘과 버튼을 양쪽에 배치
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.bookmark_border,
                size: 30,
                color: Colors.grey,
              ),
              SizedBox(height: 4),
              Text(
                "57,117",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
          SizedBox(width: 16), // 아이콘과 버튼 사이의 간격
          // 구매하기 버튼
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent, // 버튼 배경색
                padding: EdgeInsets.symmetric(vertical: 16), // 버튼 내부 패딩
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // 둥근 모서리
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: _buildBottomSheetContent(context),
                    );
                  },
                );
              },
              child: Text(
                '구매하기',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white, // 텍스트 색상
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 팝업창에 들어갈 내용
  Widget _buildBottomSheetContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 최소 크기로 설정
        children: [
          // 드롭다운 메뉴 (사이즈, 색상, 추가상품)
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: '사이즈'),
            value: selectedSize, // 현재 선택된 사이즈
            items: ['SS', 'Q', 'K', 'LK', 'CK']
                .map((size) => DropdownMenuItem(value: size, child: Text(size)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedSize = value ?? "SS"; // 값이 변경되면 selectedSize 업데이트
              });
            },
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: '색상'),
            value: selectedColor, // 현재 선택된 색상
            items: ['Red', 'Blue', 'Green', 'Orange', 'Black']
                .map((color) =>
                DropdownMenuItem(value: color, child: Text(color)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedColor = value ?? "Green"; // 값이 변경되면 selectedColor 업데이트
              });
            },
          ),
          SizedBox(height: 16),
          // 주문 금액과 버튼들
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("주문금액: 0원", style: TextStyle(fontSize: 16)),
              TextButton(
                onPressed: () {},
                child: Text('쿠폰 받기', style: TextStyle(color: Colors.redAccent)),
              ),
            ],
          ),
          SizedBox(height: 16),
          // 장바구니 버튼
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context); // 팝업창 닫기

                    // Navigator.pushNamed로 장바구니 화면으로 데이터 전달
                    Navigator.pushNamed(
                      context,
                      '/cart', // 라우트 이름
                      arguments: {
                        'selectedSize': selectedSize,
                        'selectedColor': selectedColor,
                      },
                    );
                  },
                  child: Text('장바구니'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
