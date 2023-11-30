// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../../../../../core/contants/constants.dart';
import '../../../../../core/shared/assets.dart';

class CompassImageWidget extends StatelessWidget {
  const CompassImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.imagesCompass,
      alignment: Alignment.center,
      color: !cache_helper.getData(key: 'isdark') ? blackColor : whiteColor,
    );
  }
}
