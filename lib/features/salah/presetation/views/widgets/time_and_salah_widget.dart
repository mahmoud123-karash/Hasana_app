import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';

class TimeAndSalahWidget extends StatelessWidget {
  const TimeAndSalahWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
