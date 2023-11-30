import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/features/mosaf/presentation/manager/tafsser_swiper_cubit/tafsser_swiper_cubit.dart';

import '../../../../../core/contants/constants.dart';
import 'icon_tafsser_widget.dart';

class AyaNumTafsserWidget extends StatelessWidget {
  const AyaNumTafsserWidget({
    super.key,
    required this.verseNum,
    required this.surahName,
  });
  final String verseNum;
  final String surahName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconTafsserWidget(
          ontap: () {
            TafsserSwiperCubit.get(context).decrementSwiper();
          },
          icon: Icons.arrow_back_ios,
        ),
        const Spacer(),
        Text(
          'تفسير الآية $verseNum من سورة $surahName',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color:
                cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
          ),
        ),
        const Spacer(),
        IconTafsserWidget(
          ontap: () {
            TafsserSwiperCubit.get(context).incrementSwiper();
          },
          icon: Icons.arrow_forward_ios,
        ),
      ],
    );
  }
}
