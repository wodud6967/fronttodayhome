import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/core/utils.dart';
import 'package:fronttodayhome/data/repository/user_repository.dart';
import 'package:fronttodayhome/main.dart';
import 'package:fronttodayhome/screens/main_screens.dart';
import 'package:logger/logger.dart';

//창고 겸 데이터
class SessionGM {
  int? id;
  String? username;
  String? accessToken;
  bool? isLogin;

  SessionGM({this.id, this.username, this.accessToken, this.isLogin = false});

  final mContext = navigatorKey.currentContext!;

  Future<void> login(String username, String password) async {

    // 1. 통신
    var (body, accessToken) = await UserRepository().login(username, password);


    // 2. 성공 실패
    if (body["msg"]=="성공") {
      // (1) SessionGM 값 변경
      this.id = body["body"]["id"];
      this.username = body["body"]["username"];
      this.accessToken = accessToken;
      this.isLogin = true;

      // (2) 휴대폰 하드 저장
      await secureStorage.write(key: "accessToken", value: accessToken);

      // (3) dio에 토큰 세팅
      dio.options.headers["Authorization"] = accessToken;

      // (4) 화면 이동
      Navigator.pushReplacement(mContext, MaterialPageRoute(
        builder: (context) => MainScreens(),
      ),);
    } else {
      Logger().d("로그인 실패");
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("${body["errorMessage"]}")),
      );
    }
  }

  Future<void> logout() async {
    await secureStorage.delete(key: "accessToken");
    this.id = null;
    this.username = null;
    this.accessToken = null;
    this.isLogin = false;
    Navigator.popAndPushNamed(mContext, "/login");
  }
}

final sessionProvider = StateProvider<SessionGM>((ref) {
  return SessionGM();
});
