import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/generated/l10n.dart';
import 'package:quran/quran.dart' as quran;

class AyatRowWidget extends StatelessWidget {
  const AyatRowWidget(
      {super.key, required this.randomSurah, required this.randomAyah});
  final int randomSurah;
  final int randomAyah;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          S.of(context).ayat,
          style: TextStyle(
            fontSize: 20,
            color: myColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          "${quran.getSurahNameArabic(randomSurah)}($randomAyah)",
          style: TextStyle(
            fontSize: 18,
            color: myColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
