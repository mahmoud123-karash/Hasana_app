import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/services/services.dart';
import 'package:quran_app/features/search/presentation/views/widgets/surah_text_widget.dart';

class SurahNameAndVersenumWidget extends StatelessWidget {
  const SurahNameAndVersenumWidget({
    super.key,
    required this.surahName,
    required this.verseNum,
    required this.text,
    required this.verseText,
  });
  final String surahName;
  final String verseNum;
  final String text;
  final String verseText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SurahTextWidget(text: text),
        SurahTextWidget(text: surahName),
        SurahTextWidget(text: verseNum),
        const Spacer(),
        InkWell(
          onTap: () {
            copyToClipboard(context, verseText);
          },
          child: Icon(
            Icons.copy_rounded,
            color: myColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}
