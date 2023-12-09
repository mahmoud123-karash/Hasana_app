import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';

class TextLoadPagesWidgets extends StatelessWidget {
  const TextLoadPagesWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'يتم تحميل صفحات المصحف',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: cache_helper.getData(
          key: 'isdark',
        )
            ? whiteColor
            : blackColor,
      ),
    );
  }
}
