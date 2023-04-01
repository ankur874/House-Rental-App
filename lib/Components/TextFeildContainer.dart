import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants.dart';

class TextFeildContainer extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final Widget icon;
  final bool obscureText;
  const TextFeildContainer(
      {super.key,
      required this.controller,
      required this.text,
      required this.icon,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Text(
              text,
              style: TextStyle(fontSize: 15),
            ),
          ),
          TextField(
            onChanged: (value) {
              print(text + " " + value);
            },
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              fillColor: secondaryblue,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              hintText: "Enter Your ${text}",
              prefixIcon: icon,
              contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryBlue),
                borderRadius: BorderRadius.circular(25.7),
              ),
            ),
          )
        ],
      ),
    );
  }
}
