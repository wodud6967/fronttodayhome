import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/screens/shopping/category/category_screen_vm.dart';

class CategoryCategoryList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    CategoryScreenModel model = ref.watch(CategoryScreenProvider);
    int index = model.selectedIndex;

    if (model == null || model.list == null) {
      return CircularProgressIndicator();
    } else {
      List<Map<String, dynamic>> lList = model.list!
          .map((e) => {
                "id": e.id,
                "name": e.name,
                "sCategory":
                    e.sList.map((e) => {"id": e.id, "name": e.name}).toList()
              })
          .toList();
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryList(
            selectedIndex: index,
            onCategorySelected: (index) {
              ref.read(CategoryScreenProvider.notifier).updateIndex(index);
            },
            categories: lList,
          ),
          CategoryListDetail(
              selectedIndex: index,
              categoryName: lList[index]["name"],
              sCategoryList: lList[index]["sCategory"]),
        ],
      );
    }
  }
}

class CategoryListDetail extends StatefulWidget {
  final int selectedIndex;
  final categoryName;
  final sCategoryList;

  CategoryListDetail(
      {required this.selectedIndex,
      required this.categoryName,
      required this.sCategoryList});

  @override
  State<CategoryListDetail> createState() => _CategoryListDetailState();
}

class _CategoryListDetailState extends State<CategoryListDetail> {
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> sCategoryList = widget.sCategoryList;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: MediaQuery.of(context).size.width / 4 * 3 - 36,
        child: Column(
          children: [
            Locate(widget.categoryName),
            ExpansionPanelList(
              expansionCallback: (int index, isExpanded) {
                setState(() {
                  _expandedIndex = _expandedIndex == index ? null : index;
                });
              },
              children: sCategoryList.map((detail) {
                int index = sCategoryList.indexOf(detail);
                return ExpansionPanel(
                  backgroundColor: Colors.white,
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      leading: Icon(Icons.bed),
                      title: Text(detail["name"]!),
                    );
                  },
                  body: ListTile(
                    title: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/shoppinglist");
                            },
                            child: Text("전체")),
                      ],
                    ),
                  ),
                  isExpanded: _expandedIndex == index,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Locate extends StatelessWidget {
  final name;

  Locate(this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13),
      child: Row(
        children: [
          Text(
            "$name >",
            style: TextStyle(
                fontSize: 15, color: Colors.cyan, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            "전체 펼치기",
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final int selectedIndex;
  final onCategorySelected;

  CategoryList(
      {required this.selectedIndex,
      required this.onCategorySelected,
      required this.categories});

  final List<Map<String, dynamic>> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
        children: List.generate(categories.length, (index) {
          return CategoryName(
            name: categories[index]["name"],
            isSelected: index == selectedIndex,
            onTap: () {
              onCategorySelected(index);
            },
          );
        }),
      ),
    );
  }
}

class CategoryName extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  final clickedFontColor = Color.fromRGBO(166, 171, 177, 1.0);
  final clickedBackColor = Colors.white;
  final defaultFontColor = Colors.black;
  final defaultBackColor = Color.fromRGBO(63, 70, 76, 1.0);

  CategoryName(
      {required this.name, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: defaultBackColor,
                border: Border.all(color: defaultBackColor)),
            width: double.infinity,
            height: 50,
          ),
          Positioned(
              right: 0,
              top: 10,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    color: isSelected ? clickedBackColor : defaultBackColor),
                height: 30,
                width: 95,
                child: Center(
                  child: Text(
                    "$name",
                    style: TextStyle(
                        fontSize: 15,
                        color:
                            isSelected ? defaultFontColor : clickedFontColor),
                  ), //Color.fromRGBO(166, 171, 177, 1.0)
                ),
              )),
        ],
      ),
    );
  }
}
