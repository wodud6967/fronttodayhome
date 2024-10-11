import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/login");
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(7)),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text("로그인하기",
                        style: TextStyle(color: Colors.white)),
                  )),
            )),
      ],
    );
  }
}
