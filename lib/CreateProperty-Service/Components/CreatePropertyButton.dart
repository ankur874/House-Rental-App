
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants.dart';

class CreatePropertyButton extends StatelessWidget {
  final String text;
  final bool pressed;
  final double width;
  const CreatePropertyButton(
      {super.key,
      required this.text,
      required this.pressed,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: pressed
              ? primaryGradient
              : LinearGradient(colors: [
                  Colors.grey.withOpacity(0.2),
                  Colors.grey.withOpacity(0.2)
                ]),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: pressed ? primaryBlue.withOpacity(0.2) : Colors.white,
                blurRadius: 10)
          ]),
      child: Text(
        text,
        style: TextStyle(
            color: pressed ? Colors.white : Colors.black, fontSize: 15),
      ),
    );
  }
}
