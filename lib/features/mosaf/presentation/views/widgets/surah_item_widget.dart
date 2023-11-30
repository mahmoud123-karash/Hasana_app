import 'package:flutter/material.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/page_and_juz_text_widget.dart';
import 'page_data_widget.dart';
import 'surah_image_widget.dart';

class SurahItemWidget extends StatelessWidget {
  const SurahItemWidget({super.key, required this.index, required this.image});
  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        PageDataWidget(index: index),
        const SizedBox(
          height: 5,
        ),
        SurahImageWidget(
          image: image,
        ),
        PageAndJuzTextWidget(
          index: index,
        )
      ],
    );
  }
}
