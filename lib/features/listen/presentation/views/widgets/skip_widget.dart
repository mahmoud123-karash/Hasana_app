import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';

class SkipWidget extends StatelessWidget {
  const SkipWidget({super.key, required this.ontap, required this.icon});
  final VoidCallback ontap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'skip',
      onPressed: ontap,
      icon: Icon(
        icon,
        size: 50,
        color: !cache_helper.getData(key: 'isdark') ? blackColor : whiteColor,
      ),
    );
  }
}
