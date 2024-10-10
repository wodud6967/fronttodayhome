import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/my_page/component/my_page_appbar.dart';
import 'package:fronttodayhome/screens/my_page/component/my_page_button.dart';
import 'package:fronttodayhome/screens/my_page/component/my_page_header.dart';
import 'package:fronttodayhome/screens/my_page/component/my_page_mypagelist.dart';
import 'package:fronttodayhome/screens/my_page/component/my_page_tabbar.dart';

class MyPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          MyPageAppbar(),
          SizedBox(height: 20), // MyPageAppbar와 MyPageHeader 사이에 간격 추가
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20), // 상하로만 패딩 적용
            child: MyPageHeader(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            // MyPageButton에 상하로만 패딩 적용
            child: MyPageButton(),
          ),
          MyPageTabbar(),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            // MyPageMypagelist에 상하로만 패딩 적용
            child: MyPageMypagelist(),
          ),
        ],
      ),
    );
  }
}
