import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';

import '../../manager/adhan_cubit/adhan_cubit.dart';

class ButtonPauseWidget extends StatelessWidget {
  const ButtonPauseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        AdhanCubit.get(context).stopAdhan('', true);
      },
      icon: Icon(
        Icons.pause_circle,
        color: cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
      ),
    );
  }
}
