import 'package:flutter/material.dart';
import 'package:quran_app/core/quran_data/quran_services.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/page_num_text_widget.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/page_text_data_widget.dart';

class PageAndJuzTextWidget extends StatelessWidget {
  const PageAndJuzTextWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 22,
      ),
      child: Row(
        children: [
          const PageTextDataWidget(
            text: 'الجزء',
          ),
          const SizedBox(
            width: 2,
          ),
          PageTextDataWidget(
            text: getNumberJuz(index + 1),
          ),
          const Spacer(),
          PageNumTextWidget(index: index),
          const Spacer(),
          PageTextDataWidget(
            text: gethizbText(index + 1),
          )
        ],
      ),
    );
  }
}
