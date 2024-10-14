import 'package:flutter/material.dart';

class MyPageHeader extends StatelessWidget {
  const MyPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 프로필 정보와 이미지 양쪽 배치
      children: [
        _buildHeaderProfile(), // 프로필 정보 부분
        _buildHeaderAvatar(),
      ],
    );
  }

  Widget _buildHeaderProfile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16), // 좌우 16픽셀의 패딩 적용
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // 프로필 텍스트 왼쪽 정렬
        children: [
          Text(
            "NickName", // 닉네임
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              Text(
                "팔로워", // 팔로워 텍스트
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(width: 5), // 팔로워와 수 사이의 간격
              Text(
                "0", // 팔로워 수
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _buildHeaderAvatar extends StatelessWidget {
  const _buildHeaderAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/avatar.png"), // 아바타 이미지
      ),
    );
  }
}
