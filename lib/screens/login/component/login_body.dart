import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 70),
        _Title(),
        SizedBox(height: 70),
        _EmailLogin(),
        SizedBox(height: 30),
        Expanded(
          child: _Buttons(),
        ),

      ],
    );
  }
}

class _Buttons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ListView(
        children: [
          _KakaoButton(),
          SizedBox(height: 50),
          _OthersButton(),
          SizedBox(height: 50),
          Center(child: Text("로그인에 문제가 있으신가요?")),
        ],
      ),
    );
  }
}

class _EmailLogin extends StatelessWidget {
  final _username = TextEditingController();
  final _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 200,
            child: Column(
              children: [
                TextFormField(
                  controller: _username,
                  decoration: InputDecoration(
                    hintText: "username",
                    prefixIcon: Icon(Icons.person),
                    disabledBorder: InputBorder.none,
                  ),
                ),
                TextFormField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "password",
                    prefixIcon: Icon(Icons.key),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 90,
            width: 70,
            decoration: BoxDecoration(color: Colors.lightBlueAccent,borderRadius: BorderRadius.circular(13)),
            child: InkWell(onTap: (){},child: Center(child: Text("로그인",style: GoogleFonts.dongle(fontSize: 30,color: Colors.white),))),
          ),
        ],
      ),
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
        Text("이메일로 로그인", style: TextStyle(color: Colors.black, fontSize: 15)),
        Container(
          height: 15,
          child: VerticalDivider(
            color: Colors.black26,
            thickness: 1,
          ),
        ),
        Text("이메일로 가입", style: TextStyle(color: Colors.black, fontSize: 15)),
      ],
    );
  }
}

class _OthersButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {FocusScope.of(context).unfocus()},
        child: Text("오늘의집",
            style: GoogleFonts.dongle(
                fontSize: 75,
                color: Colors.black,
                fontWeight: FontWeight.bold)));
  }
}
