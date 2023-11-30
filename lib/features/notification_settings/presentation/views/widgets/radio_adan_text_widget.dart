import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../../../../../core/contants/constants.dart';

class RadioAdanTextWidget extends StatelessWidget {
  const RadioAdanTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
      ),
    );
  }
}
