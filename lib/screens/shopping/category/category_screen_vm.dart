// 뷰 모델 (창고)
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryCategoryListScreenVm extends StateNotifier<int> {
  CategoryCategoryListScreenVm(super.state);

  void updateIndex(int newIndex) {
    state = newIndex;
  }
}

// 뷰 모델 관리하는 관리자 (창고 관리자)
// watch하거나, read할때 실행됨 (View에서 실행시킴)
final CategoryScreenProvider = StateNotifierProvider<CategoryCategoryListScreenVm, int>((ref) {
  CategoryCategoryListScreenVm vm = CategoryCategoryListScreenVm(0);
  return vm;
});
