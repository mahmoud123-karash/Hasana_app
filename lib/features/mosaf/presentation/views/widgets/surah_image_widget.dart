import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/features/mosaf/presentation/views/tafsser_screen.dart';

import '../../../../../core/contants/constants.dart';
import '../../../../../core/shared/components.dart';

class SurahImageWidget extends StatelessWidget {
  const SurahImageWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: gColor,
      onTap: () {
        navigatorTo(context, const TafsserScreen());
      },
      child: SizedBox(
        height: size(context).height - 200,
        child: Image.file(
          File(image),
          color: cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
