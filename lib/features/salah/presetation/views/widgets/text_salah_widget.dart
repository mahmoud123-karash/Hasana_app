import 'package:flutter/material.dart';

class TextSalahsWidget extends StatelessWidget {
  const TextSalahsWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
