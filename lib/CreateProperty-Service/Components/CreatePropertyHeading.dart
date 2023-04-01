import 'package:flutter/material.dart';

class CreatePropertyHeading extends StatelessWidget {
  final String text;
  const CreatePropertyHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
    );
  }
}
