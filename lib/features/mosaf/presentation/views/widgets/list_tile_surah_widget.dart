// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/quran_data/surah_page.dart';
import 'package:quran_app/core/shared/assets.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/features/mosaf/presentation/manager/page_cubit/page_cubit.dart';

class ListTileSurahWidget extends StatelessWidget {
  const ListTileSurahWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
        "آياتها ${quran.getVerseCount(index + 1).toString()}",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
        ),
      ),
      onTap: () {
        PageCubit.get(context)
            .goToPage(page: SurahPage.navigateToFirstPage(index) - 1);
        PageCubit.get(context).closeDrawer();
      },
      leading: Text(
        Intl.getCurrentLocale() == 'ar'
            ? quran.getVerseEndSymbol(index + 1)
            : (index + 1).toString(),
        style: TextStyle(
          fontSize: 25,
          color: cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
        ),
      ),
      title: Text(
        Intl.getCurrentLocale() == 'ar'
            ? quran.getSurahNameArabic(index + 1)
            : quran.getSurahName(index + 1),
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: textfamilyAus1,
          color: cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
        ),
      ),
      trailing: quran.getPlaceOfRevelation(index + 1) == 'Makkah'
          ? SizedBox(
              height: 30,
              width: 40,
              child: Image.asset(Assets.imagesMakka),
            )
          : SizedBox(
              height: 50,
              width: 45,
              child: Image.asset(Assets.imagesMasjid),
            ),
    );
  }
}
