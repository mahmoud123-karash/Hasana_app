import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/generated/l10n.dart';

class SettingDiologWidget extends StatelessWidget {
  const SettingDiologWidget(
      {super.key, required this.resetTap, required this.zeroTap});
  final VoidCallback resetTap;
  final VoidCallback zeroTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        S.of(context).settings,
        style: TextStyle(color: myColor),
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: size(context).height / 7,
        child: Column(
          children: [
            TextButton(
              onPressed: resetTap,
              child: Text(
                S.of(context).zero,
                style: TextStyle(
                  fontSize: 20,
                  color: !cache_helper.getData(key: 'isdark')
                      ? blackColor
                      : whiteColor,
                ),
              ),
            ),
            TextButton(
              onPressed: zeroTap,
              child: Text(
                S.of(context).removeall,
                style: TextStyle(
                  fontSize: 20,
                  color: !cache_helper.getData(key: 'isdark')
                      ? blackColor
                      : whiteColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
