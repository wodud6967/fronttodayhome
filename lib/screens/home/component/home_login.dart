import 'package:flutter/material.dart';

class HomeLogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ()=> {FocusScope.of(context).unfocus()},
          child: Container(
            height: 300,
            color: Colors.yellow,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: "username",
            prefixIcon: Icon(Icons.person),
          ),
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "password",
            prefixIcon: Icon(Icons.key),
          ),
        ),
      ],
    );;
  }
}
