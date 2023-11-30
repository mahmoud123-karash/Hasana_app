import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../../../../../core/contants/constants.dart';

class SwitchListTileWidget extends StatelessWidget {
  const SwitchListTileWidget(
      {super.key,
      required this.text,
      required this.onChanged,
      required this.value});
  final String text;
  final void Function(bool) onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    bool isDark = cache_helper.getData(key: 'isdark');
    return SwitchListTile(
      secondary: Icon(
        Icons.alarm_rounded,
        color: isDark ? whiteColor : blackColor,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: isDark ? whiteColor : blackColor,
        ),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
