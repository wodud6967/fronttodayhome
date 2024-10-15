// 뷰 모델 (창고)
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/data/repository/category_repository.dart';

class CategoryScreenModel {
  int selectedIndex = 0;
  List<_LCategory>? list;

  CategoryScreenModel({required this.selectedIndex, this.list});
}

class _LCategory {
  int id;
  String name;
  List<_SCategory> sList;

  _LCategory(this.id, this.name, this.sList);

  _LCategory.fromMap(map)
      : this.id = map["seleted"],
        this.name = map["name"],
        this.sList = (map["subCategoryDTOS"] as List<dynamic>)
            .map((e) => _SCategory.fromMap(e))
            .toList();
}

class _SCategory {
  int id;
  String name;

  _SCategory(this.id, this.name);

  _SCategory.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"];
}

class CategoryScreenVm extends StateNotifier<CategoryScreenModel> {
  CategoryScreenVm(super.state);

  List<_LCategory>? categorys;

  Future<void> notifyInit() async {
    // 1. 통신을 해서 응답 받기
    List<dynamic> list = await CategoryRepository().findAll();
    categorys =
        list.map((e) => _LCategory.fromMap(e)).toList();

    // 2. 상태 갱신
    state = CategoryScreenModel(selectedIndex: 0, list: categorys);
  }

  void updateIndex(int newIndex) {
    state = CategoryScreenModel(selectedIndex: newIndex, list: categorys);
  }
}

// 뷰 모델 관리하는 관리자 (창고 관리자)
// watch하거나, read할때 실행됨 (View에서 실행시킴)
final CategoryScreenProvider =
    StateNotifierProvider<CategoryScreenVm, CategoryScreenModel>((ref) {
  return CategoryScreenVm(CategoryScreenModel(selectedIndex: 0))..notifyInit();
});
