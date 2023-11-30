import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';

class VerseNumberWidget extends StatelessWidget {
  const VerseNumberWidget({
    super.key,
    required this.verseCount,
  });
  final int verseCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'عدد الآيات $verseCount',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: myColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
