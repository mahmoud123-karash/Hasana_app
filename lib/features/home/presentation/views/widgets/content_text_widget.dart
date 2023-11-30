import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';

class ContentTextWidget extends StatelessWidget {
  const ContentTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: myColor,
      ),
    );
  }
}
