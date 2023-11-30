import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../../../../../core/contants/constants.dart';

class PageNumTextWidget extends StatelessWidget {
  const PageNumTextWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      'صفحة ${ArabicNumbers().convert(index + 1)}',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
      ),
    );
  }
}
