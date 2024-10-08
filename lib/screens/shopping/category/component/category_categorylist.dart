import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/screens/shopping/category/category_screen_vm.dart';

class CategoryCategoryList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    int index = ref.watch(CategoryScreenProvider);
    final List<String> categories = [
      "가구",
      "패브릭",
      "가전/디지털",
      "주방용품",
      "식품",
      "데코/식물"
    ];
    String selectedCategory = categories[index];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryList(
          selectedIndex: index,
          onCategorySelected: (index) {
            ref.read(CategoryScreenProvider.notifier).updateIndex(index);
          },
          categories: categories,
        ),
        CategoryListDetail(selectedIndex: index, categoryName: selectedCategory),
      ],
    );
  }
}

class CategoryListDetail extends StatefulWidget {
  final int selectedIndex;
  final categoryName;

  CategoryListDetail({required this.selectedIndex, required this.categoryName});

  @override
  State<CategoryListDetail> createState() => _CategoryListDetailState();
}

class _CategoryListDetailState extends State<CategoryListDetail> {
  int? _expandedIndex;

  final Map<int, List<Map<String, String>>> categoryDetails = {
    0: [
      {"title": "침대", "detail": "전체"},
      {"title": "의자", "detail": "여러 의자 상세"},
    ],
    1: [
      {"title": "이불세트", "detail": "이불세트 세부사항"},
      {"title": "커튼부자재", "detail": "커튼부자재 세부사항"},
    ],
    2: [
      {"title": "냉장고", "detail": "냉장고 세부사항"},
      {"title": "청소기", "detail": "청소기 세부사항"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> details =
        categoryDetails[widget.selectedIndex] ?? [];
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
              children: details.map((detail) {
                int index = details.indexOf(detail);
                return ExpansionPanel(
                  backgroundColor: Colors.white,
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      leading: Icon(Icons.bed),
                      title: Text(detail["title"]!),
                    );
                  },
                  body: ListTile(
                    title: Column(
                      children: [
                        InkWell(
                          onTap: (){Navigator.pushNamed(context, "/shoppinglist");},
                            child: Text(detail["detail"]!)),
                        Text(detail["detail"]!),
                        Text(detail["detail"]!),
                        Text(detail["detail"]!),
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

  ExpansionPanel buildExpansionPanel(title, detail, index) {
    return ExpansionPanel(
      backgroundColor: Colors.white,
      canTapOnHeader: true,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          leading: Icon(Icons.bed),
          title: Text("$title"),
        );
      },
      body: ListTile(
          title: Wrap(
        children: [
          Text("$detail"),
          Text("$detail"),
          Text("$detail"),
          Text("$detail"),
        ],
      )),
      isExpanded: _expandedIndex == index,
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

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
        children: List.generate(categories.length, (index) {
          return CategoryName(
            name: categories[index],
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
