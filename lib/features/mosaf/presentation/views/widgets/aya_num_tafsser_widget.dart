import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/features/mosaf/presentation/manager/tafsser_swiper_cubit/tafsser_swiper_cubit.dart';

import '../../../../../core/contants/constants.dart';
import 'icon_tafsser_widget.dart';

class AyaNumTafsserWidget extends StatelessWidget {
  const AyaNumTafsserWidget({
    super.key,
    required this.verseNum,
    required this.surahName,
    required this.firstVerse,
    required this.lastVerse,
  });
  final int verseNum;
  final String surahName;
  final int firstVerse;
  final int lastVerse;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconTafsserWidget(
          ontap: () {
            if (firstVerse == verseNum) {
              myToast(
                message: 'الآية الاولى في الصفحة',
                gravity: ToastGravity.BOTTOM,
              );
            } else {
              TafsserSwiperCubit.get(context).decrementSwiper();
            }
          },
          icon: Icons.arrow_back_ios,
          color: firstVerse == verseNum ? gColor! : myColor!,
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
            if (lastVerse == verseNum) {
              myToast(
                message: 'الآية الأخيرة في الصفحة',
                gravity: ToastGravity.BOTTOM,
              );
            } else {
              TafsserSwiperCubit.get(context).incrementSwiper();
            }
          },
          icon: Icons.arrow_forward_ios,
          color: lastVerse == verseNum ? gColor! : myColor!,
        ),
      ],
    );
  }
}
