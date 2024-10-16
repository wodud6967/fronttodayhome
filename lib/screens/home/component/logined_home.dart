import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/data/gm/session_gm.dart';

class LoginedHome extends ConsumerWidget {

  @override
  Widget build(BuildContext context,ref) {
    var session = ref.read(sessionProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 200),
        Text("안녕하세요.",style: TextStyle(fontSize: 70,color: Colors.black)),
        Text("${session.username}",style: TextStyle(fontSize: 70,color: Colors.black)),
        SizedBox(height: 50),
        InkWell(
          onTap: (){ session.logout();},
          child: Container(
            decoration: BoxDecoration(color: Colors.lightBlueAccent,borderRadius: BorderRadius.circular(13)),
            width: 180,
            height: 100,
            child: Center(child: Text("로그아웃",style: TextStyle(fontSize: 30,color: Colors.white))),
          ),
        ),
      ],
    );
  }
}
