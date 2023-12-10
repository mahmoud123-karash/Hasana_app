import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/core/contants/constants.dart';

class VerseTextWidget extends StatelessWidget {
  const VerseTextWidget({super.key, required this.verseText});
  final String verseText;

  @override
  Widget build(BuildContext context) {
    return Text(
      textWidthBasis: TextWidthBasis.parent,
      verseText,
      style: GoogleFonts.lateef(
        color: blackColor,
        fontSize: 27,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      textAlign: TextAlign.justify,
    );
  }
}
