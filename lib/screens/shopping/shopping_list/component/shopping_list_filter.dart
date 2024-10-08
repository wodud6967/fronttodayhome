import 'package:flutter/material.dart';

class ShoppingListFilter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        Filter("침구 사이즈"),
        Filter("프레임 형태"),
        Filter("브랜드"),
        MoreFilterButton(),
        Container(height: 15, color: Colors.black12),
      ],
    );
  }
}

class MoreFilterButton extends StatelessWidget {
  const MoreFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text("필터 더보기 >",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.w600),),
    );
  }
}

class Filter extends StatelessWidget{
  final name;

  Filter(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(
        bottom: BorderSide(color: Colors.black12)
      )),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0,bottom: 16.0),
        child: Row(
          children: [
            SizedBox(
              height: 21,
                width: 80,
                child: Text("$name", style: TextStyle(color: Colors.black))),
            SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 21,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FilterName("수퍼킹(SK)"),
                    FilterName("라지킹(LK)"),
                    FilterName("퀸(Q)"),
                    FilterName("슈퍼싱글(SS)"),
                    FilterName("싱글(S)"),
                    FilterName("멀티싱글(MS)"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterName extends StatelessWidget {
  final name;

  const FilterName(this.name);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text("$name"),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Icon(Icons.filter_alt_sharp,color: Colors.lightBlueAccent),
        ),
        Text("필터로 원하는 상품 찾기",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
      ],
    );
  }

}
