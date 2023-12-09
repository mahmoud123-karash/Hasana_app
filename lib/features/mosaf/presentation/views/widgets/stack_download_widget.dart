import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:quran_app/core/contants/constants.dart';

class StackDownloadWidget extends StatelessWidget {
  const StackDownloadWidget({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: RoundedProgressBar(
            childLeft: Text(
              "${(count / 604 * 100).toStringAsFixed(0)}%",
              style: TextStyle(
                color: blackColor,
              ),
            ),
            percent: (count / 604 * 100),
            theme: RoundedProgressBarTheme.green,
          ),
        ),
      ],
    );
  }
}
