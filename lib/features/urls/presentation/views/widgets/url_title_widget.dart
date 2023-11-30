import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../../../../../core/contants/constants.dart';

class UrlTitleWidget extends StatelessWidget {
  const UrlTitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: !cache_helper.getData(key: 'isdark') ? blackColor : whiteColor,
      ),
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }
}
