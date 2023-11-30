import 'package:flutter/material.dart';
import 'package:quran/quran.dart';

import '../../../../../core/contants/constants.dart';
import '../../../data/models/verse_model.dart';
import 'surah_name_and_verse_num_widget.dart';
import 'verse_text_widget.dart';

class VerseItemWidget extends StatelessWidget {
  const VerseItemWidget({super.key, required this.verse});
  final VerseModel verse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              SurahNameAndVersenumWidget(
                text: 'سُورَةُ ',
                surahName: '${getSurahNameArabic(verse.surahNum)}: ',
                verseNum: '${verse.verseNum}',
                verseText: verse.verseText,
              ),
              const SizedBox(
                height: 5,
              ),
              VerseTextWidget(
                verseText: verse.verseText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
