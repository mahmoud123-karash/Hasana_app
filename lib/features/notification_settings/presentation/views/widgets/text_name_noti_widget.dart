import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';

class TextNameNotiWidget extends StatelessWidget {
  const TextNameNotiWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: myColor,
        ),
      ),
    );
  }
}
