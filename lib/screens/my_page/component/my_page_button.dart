import 'package:flutter/material.dart';

class MyPageButton extends StatelessWidget {
  const MyPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20), // 상하 여백 설정
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          // 리워드 혜택 버튼
          _RewordButton(),
          Spacer(), // 버튼들 사이에 간격 추가
          // 프로필 수정 버튼
          _ProfileUpdateButton(),
          Spacer(), // 버튼들 사이에 간격 추가
          // 공유 버튼
          _ShareButton(),

          Spacer(),
        ],
      ),
    );
  }
}

// 리워드 혜택 버튼
class _RewordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("리워드 혜택 클릭됨");
      },
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "리워드 혜택",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// 프로필 수정 버튼
class _ProfileUpdateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("프로필 수정 클릭됨");
      },
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey), // 테두리 설정
        ),
        child: Text(
          "프로필 수정",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// 공유 버튼
class _ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("공유 클릭됨");
        Navigator.pushNamed(context, "/kakaopay");
      },
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey), // 테두리 설정
        ),
        child: Icon(
          Icons.share_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
