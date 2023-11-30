import 'package:flutter/material.dart';

class VerseTextWidget extends StatelessWidget {
  const VerseTextWidget({super.key, required this.color, required this.text});
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: color,
      ),
      textAlign: TextAlign.justify,
    );
  }
}
