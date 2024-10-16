import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/product_detail_repository.dart';
import '../shopping/shopping_list/shopping_list_vm.dart';






class ProductDetailVm extends StateNotifier<Product?> {
  ProductDetailVm() : super(null);

  String? selectedSize;
  String? selectedColor;

  Future<void> fetchProductDetail(int productId) async {
    final productData = await ProductDetailRepository().findById(productId);
    state = Product.fromJson(productData);
  }

  void selectSize(String size) {
    selectedSize = size;
    _refreshState();
  }

  void selectColor(String color) {
    selectedColor = color;
    _refreshState();
  }

  void _refreshState() {
    state = state?.copyWith(); // Trigger state update
  }
}

extension on Product? {
  Product? copyWith() {}
}

final productDetailProvider = StateNotifierProvider.autoDispose.family<ProductDetailVm, Product?, int>((ref, productId) {
  return ProductDetailVm()..fetchProductDetail(productId);
});