import 'package:flutter/material.dart';

class MyPageAppbar extends StatelessWidget {
  const MyPageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start, //텍스트 붙이기
        children: [
          _TextProfile(),
          SizedBox(
            width: 10,
          ),
          _TextShopping(),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_none),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _TextShopping extends StatelessWidget {
  const _TextShopping({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("쇼핑 클릭됨");
      },
      child: Text(
        "쇼핑",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

class _TextProfile extends StatelessWidget {
  const _TextProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("프로필 클릭됨");
      },
      child: Text(
        "프로필",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
