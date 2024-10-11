import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Title(),
        SizedBox(height: 70),
        _KakaoButton(),
        SizedBox(height: 50),
        _OthersButton(),
        SizedBox(height: 30),
        _ForEmail(),
        SizedBox(height: 20),
        Text("로그인에 문제가 있으신가요?"),
      ],
    );
  }
}

class _ForEmail extends StatelessWidget {
  const _ForEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("이메일로 로그인",style: TextStyle(color: Colors.black,fontSize: 15)),
        Container(
          height: 15,
          child: VerticalDivider(
            color: Colors.black26,
            thickness: 1,
          ),
        ),
        Text("이메일로 가입",style: TextStyle(color: Colors.black,fontSize: 15)),
      ],
    );
  }
}

class _OthersButton extends StatelessWidget {
  const _OthersButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            child: Image.asset("assets/naver_login.png"),
          ),
          Container(
            width: 50,
            height: 50,
            child: Image.asset("assets/apple_login.png"),
          ),
          Container(
            width: 50,
            height: 50,
            child: Image.asset("assets/google_login.png"),
          ),
        ],
      ),
    );
  }
}

class _KakaoButton extends StatelessWidget {
  const _KakaoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/kakao_login_medium_wide.png"),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Text("오늘의집",
            style:
                GoogleFonts.dongle(fontSize: 75, color: Colors.black,fontWeight: FontWeight.bold)));
  }
}
