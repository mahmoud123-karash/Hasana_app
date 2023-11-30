import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../../../../../core/contants/constants.dart';

class CircularPercentIndicatorWidget extends StatelessWidget {
  const CircularPercentIndicatorWidget(
      {super.key,
      required this.color,
      required this.percent,
      required this.text});
  final Color color;
  final double percent;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animateFromLastPercent: true,
      radius: 130.0,
      animation: true,
      animationDuration: 2000,
      lineWidth: 20.0,
      percent: percent,
      center: Text(
        text,
        style: GoogleFonts.alkatra(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: !cache_helper.getData(key: 'isdark') ? blackColor : whiteColor,
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Colors.grey[300]!,
      progressColor: color,
    );
  }
}
