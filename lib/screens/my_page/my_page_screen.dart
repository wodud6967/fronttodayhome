import 'package:flutter/material.dart';

import 'component/my_page_appbar.dart';
import 'component/my_page_button.dart';
import 'component/my_page_header.dart';
import 'component/my_page_tabbar.dart';

class MyPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyPageAppbar(),
          SizedBox(height: 20), // MyPageAppbar와 MyPageHeader 사이에 간격 추가
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),

            // 상하로만 패딩 적용
            child: MyPageHeader(),
          ),
          // MyPageButton에 상하로만 패딩 적용
          MyPageButton(),
          Expanded(
            // 여기에 Expanded 추가
            child: MyPageTabbar(),
          ),
        ],
      ),
    );
  }
}
