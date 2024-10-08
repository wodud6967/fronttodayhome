import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/screens/shopping/category/category_screen_vm.dart';

class CategoryCategoryList extends ConsumerWidget {

  @override
  Widget build(BuildContext context,ref) {
    int index = ref.watch(CategoryScreenProvider);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryList(
          selectedIndex: index,
          onCategorySelected: (index) {
            ref.read(CategoryScreenProvider.notifier).updateIndex(index);
          },
        ),
        CategoryListDetail(),
      ],
    );
  }
}

class CategoryListDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width / 4 * 3 - 36,
        child: Column(
          children: [
            Locate(),
            DetailCategory(Icons.bed, "침대"),
            DetailCategory(Icons.chair, "의자"),
          ],
        ),
      ),
    );
  }
}

class DetailCategory extends StatelessWidget {
  final IconData mIcon;
  final name;

  DetailCategory(this.mIcon, this.name);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/shoppinglist");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(children: [
          Icon(
            mIcon,
            size: 40,
          ),
          SizedBox(width: 18),
          Text("$name")
        ]),
      ),
    );
  }
}

class Locate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13),
      child: Row(
        children: [
          Text(
            "가구 >",
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
  final Function(int) onCategorySelected;

  CategoryList({required this.selectedIndex, required this.onCategorySelected});

  final List<String> categories = [
    "가구",
    "패브릭",
    "가전/디지털",
    "주방용품",
    "식품",
    "데코/식물"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width / 4,
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
                    style: TextStyle(fontSize: 15,
                        color: isSelected
                            ? defaultFontColor
                            : clickedFontColor),
                  ), //Color.fromRGBO(166, 171, 177, 1.0)
                ),
              )),
        ],
      ),
    );
  }
}
