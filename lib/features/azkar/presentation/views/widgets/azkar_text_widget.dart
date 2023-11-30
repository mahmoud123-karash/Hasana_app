import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/generated/l10n.dart';

import '../../../../../core/contants/constants.dart';

class AzkarTextWidget extends StatelessWidget {
  const AzkarTextWidget(
      {super.key,
      required this.index,
      required this.content,
      required this.count});
  final int index;
  final String content;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            content,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color:
                  cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            count,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: myColor,
            ),
          ),
          Text(
            S.of(context).times,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: myColor,
            ),
          )
        ],
      ),
    );
  }
}

List<int> ints = [
  1,
  2,
  8,
];
