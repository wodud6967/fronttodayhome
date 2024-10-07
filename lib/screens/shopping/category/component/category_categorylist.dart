import 'package:flutter/material.dart';

class CategoryCategorylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        categorylist(),
        categorylistDetail(),
      ],
    );
  }
}

class categorylistDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: MediaQuery.of(context).size.width / 4 * 3 - 36,
        child: Column(
          children: [
            Locate(),
            DetailCategory(Icons.bed,"침대"),
            DetailCategory(Icons.chair,"의자"),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(children: [Icon(mIcon,size: 40,),SizedBox(width: 18), Text("$name")]),
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
          Text("전체 펼치기",style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}

class categorylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
        children: [
          CategoryName("가구"),
          CategoryName("패브릭"),
          CategoryName("가전/디지털"),
          CategoryName("주방용품"),
          CategoryName("식품"),
          CategoryName("데코/식물"),
        ],
      ),
    );
  }
}

class CategoryName extends StatelessWidget {
  final name;

  CategoryName(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(63, 70, 76, 1.0),
            border: Border.all(color: Color.fromRGBO(63, 70, 76, 1.0))),
        width: double.infinity,
        height: 50,
        child: Center(
            child: Text(
          "$name",
          style: TextStyle(
              fontSize: 15, color: Color.fromRGBO(166, 171, 177, 1.0)),
        )));
  }
}
