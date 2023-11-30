import 'package:flutter/material.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/duration_text_widget.dart';

class DurationRowWidget extends StatelessWidget {
  const DurationRowWidget(
      {super.key, required this.minText, required this.maxText});
  final String minText;
  final String maxText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          DurationTextWidget(text: maxText),
          const Spacer(),
          DurationTextWidget(text: minText),
        ],
      ),
    );
  }
}
