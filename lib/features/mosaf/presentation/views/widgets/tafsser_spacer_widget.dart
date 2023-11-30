import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';

class TafsserSpacerWidget extends StatelessWidget {
  const TafsserSpacerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Container(
        width: double.infinity,
        height: 1,
        color: cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
      ),
    );
  }
}
