import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';

class HomeTextWidget extends StatelessWidget {
  const HomeTextWidget({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color:
                !cache_helper.getData(key: 'isdark') ? blackColor : whiteColor,
          ),
        ),
      ],
    );
  }
}
