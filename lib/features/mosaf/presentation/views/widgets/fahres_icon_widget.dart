import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/mosaf/presentation/manager/page_cubit/page_cubit.dart';

class FahresIconWidget extends StatelessWidget {
  const FahresIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        PageCubit.get(context).openDrawer();
      },
      icon: Icon(
        Icons.menu,
        color: cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
      ),
    );
  }
}
