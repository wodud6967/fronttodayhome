import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/shopping/shopping_list/shopping_list_vm.dart';
import 'package:logger/logger.dart';
import '../../../data/repository/cart_repository.dart';

class ProductDetailNavibar extends StatefulWidget {
  final Product product; // 수정: Product 객체 추가
  const ProductDetailNavibar({super.key, required this.product});

  @override
  _ProductDetailNavibarState createState() => _ProductDetailNavibarState();
}

class _ProductDetailNavibarState extends State<ProductDetailNavibar> {
  String selectedSize = "스몰";
  String selectedColor = "화이트";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 80,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
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
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheetContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: '사이즈'),
            value: selectedSize,
            items: ['스몰', '퀸', '킹']
                .map((size) => DropdownMenuItem(value: size, child: Text(size)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedSize = value ?? "스몰";
              });
            },
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: '색상'),
            value: selectedColor,
            items: ['화이트', '블랙', '초록', '주황', '검정']
                .map((color) => DropdownMenuItem(value: color, child: Text(color)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedColor = value ?? "화이트";
              });
            },
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("주문금액: ${widget.product.price}원", style: TextStyle(fontSize: 16)),
              TextButton(
                onPressed: () {},
                child: Text('쿠폰 받기', style: TextStyle(color: Colors.redAccent)),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    try {
                      await CartRepository().addToCart(
                        inventoryId: widget.product.id,
                        price: widget.product.price,
                        totalPrice: widget.product.price, // 기본적으로 상품 가격 사용
                      );
                      Navigator.pushNamed(context, '/cart');
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("장바구니 추가 실패: $e")),
                      );
                    }
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