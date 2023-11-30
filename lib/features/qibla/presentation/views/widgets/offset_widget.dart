import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../../../../../core/contants/constants.dart';

class OffsetWidget extends StatelessWidget {
  const OffsetWidget({super.key, required this.offset});
  final double offset;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FlutterIslamicIcons.solidKaaba,
          color: !cache_helper.getData(key: 'isdark') ? blackColor : whiteColor,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          "${offset.toStringAsFixed(0)}°   SE   من الشمال الحقيقي",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color:
                !cache_helper.getData(key: 'isdark') ? blackColor : whiteColor,
          ),
        ),
      ],
    );
  }
}
