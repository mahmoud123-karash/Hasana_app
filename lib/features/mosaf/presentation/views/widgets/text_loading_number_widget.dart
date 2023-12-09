import 'package:flutter/widgets.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';

class TextLoadingNumberWidget extends StatelessWidget {
  const TextLoadingNumberWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
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
