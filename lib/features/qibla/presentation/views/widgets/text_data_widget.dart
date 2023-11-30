import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../../../../../core/contants/constants.dart';

class TextDataWidget extends StatelessWidget {
  const TextDataWidget(
      {super.key, required this.text, required this.direction});
  final String text;
  final double direction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color:
                !cache_helper.getData(key: 'isdark') ? blackColor : whiteColor,
          ),
        ),
        Text(
          '${direction.toStringAsFixed(0)}°',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color:
                !cache_helper.getData(key: 'isdark') ? blackColor : whiteColor,
          ),
        ),
      ],
    );
  }
}
