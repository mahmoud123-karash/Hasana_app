import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../../../../../core/contants/constants.dart';

class NameTextWidget extends StatelessWidget {
  const NameTextWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 25,
        color: !cache_helper.getData(key: 'isdark') ? blackColor : whiteColor,
      ),
    );
  }
}
