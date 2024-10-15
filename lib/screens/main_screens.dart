import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/data/gm/session_gm.dart';
import 'package:fronttodayhome/screens/home/home_sceen.dart';
import 'package:fronttodayhome/screens/login/login_screen.dart';
import 'package:fronttodayhome/screens/looking/looking_screen.dart';
import 'package:fronttodayhome/screens/my_page/my_page_screen.dart';
import 'package:fronttodayhome/screens/shopping/category/category_screen.dart';

class MainScreens extends StatefulWidget {
  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var session = ref.watch(sessionProvider);

        return Scaffold(
          body: _MainBody(selectedIndex: _selectedIndex),
          bottomNavigationBar: (session.isLogin ?? false) // 로그인 상태에 따라 표시 여부 결정
              ? BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              const BottomNavigationBarItem(
                  label: '홈', icon: Icon(CupertinoIcons.home)),
              const BottomNavigationBarItem(
                  label: '둘러보기',
                  icon: Icon(CupertinoIcons.square_fill_on_square_fill)),
              const BottomNavigationBarItem(
                  label: '쇼핑', icon: Icon(CupertinoIcons.placemark_fill)),
              const BottomNavigationBarItem(
                  label: '마이페이지', icon: Icon(CupertinoIcons.person_fill)),
            ],
          )
              : null, // 로그인하지 않은 경우에는 BottomNavigationBar 숨김
        );
      },
    );
  }
}

class _MainBody extends ConsumerWidget {
  const _MainBody({
    super.key,
    required int selectedIndex,
  }) : _selectedIndex = selectedIndex;

  final int _selectedIndex;

  @override
  Widget build(BuildContext context, ref) {
    var session = ref.watch(sessionProvider);
    List<Widget> pages;
    if (session.isLogin ?? false) {
      // 로그인 상태라면
      pages = [
        HomeScreen(),
        LookingScreen(),
        CategoryScreen(),
        MyPageScreen(),
      ];
    } else {
      // 로그인하지 않은 경우
      pages = [
        LoginScreen(),
      ];
    }

    return IndexedStack(
      index: _selectedIndex,
      children: pages,
    );
  }
}
