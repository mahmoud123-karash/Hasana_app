import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../../../../../core/contants/constants.dart';

class DurationTextWidget extends StatelessWidget {
  const DurationTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: !cache_helper.getData(key: 'isdark') ? blackColor : whiteColor,
      ),
    );
  }
}
