import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../../../../../core/contants/constants.dart';

class VersionTextWidget extends StatelessWidget {
  const VersionTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '1.0.0:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color:
                  cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
            ),
          ),
          Text(
            'Version',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color:
                  cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
