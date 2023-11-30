import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';

class NextSalahTextWidget extends StatelessWidget {
  const NextSalahTextWidget(
      {super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: whiteColor,
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.amberAccent,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
