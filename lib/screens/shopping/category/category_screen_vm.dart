// 뷰 모델 (창고)
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/data/category_repository.dart';

class CategoryScreenModel {
  int selectedIndex = 1;
  List<_LCategory>? list;
  CategoryScreenModel({required this.selectedIndex, this.list});
}
class _LCategory{
  int id;
  String name;
  List<_LCategory> sList;

  _LCategory(this.id,this.name,this.sList);

}
class _SCategory{
  int id;
  String name;
  _SCategory(this.id, this.name);
}

class CategoryScreenVm extends StateNotifier<CategoryScreenModel> {
  CategoryScreenVm(super.state);

  Future<void> notifyInit() async {
    // 1. 통신을 해서 응답 받기
    List<dynamic> list = await CategoryRepository().findAll();


    // 2. 상태 갱신
    state = CategoryScreenModel(selectedIndex: 0, list: list);
  }

  void updateIndex(int newIndex) {
    state = CategoryScreenModel(selectedIndex: newIndex);
  }
}

// 뷰 모델 관리하는 관리자 (창고 관리자)
// watch하거나, read할때 실행됨 (View에서 실행시킴)
final CategoryScreenProvider =
    StateNotifierProvider<CategoryScreenVm, CategoryScreenModel>((ref) {
  return CategoryScreenVm(CategoryScreenModel(selectedIndex: 0))..notifyInit();
});
