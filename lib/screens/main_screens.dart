import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fronttodayhome/screens/home/home_sceen.dart';
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
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        // ❶
        children: [
          HomeScreen(),
          LookingScreen(),
          CategoryScreen(),
          MyPageScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // ❷
        backgroundColor: Colors.white,
        // ❸
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        // ❹
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
      ),
    );
  }
}
