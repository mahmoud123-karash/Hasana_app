import 'package:flutter/material.dart';

import '../../../../../core/contants/constants.dart';

class SurahTextWidget extends StatelessWidget {
  const SurahTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: myColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
