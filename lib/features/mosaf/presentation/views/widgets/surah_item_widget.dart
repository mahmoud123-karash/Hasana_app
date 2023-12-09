import 'package:flutter/material.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/page_and_juz_text_widget.dart';
import 'page_data_widget.dart';
import 'surah_image_widget.dart';

class SurahItemWidget extends StatelessWidget {
  const SurahItemWidget({
    super.key,
    required this.index,
    required this.image,
    required this.count,
  });
  final int index;
  final String image;
  final int count;

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
        count != 604
            ? const Center(child: CircularProgressIndicator())
            : SurahImageWidget(
                image: image,
              ),
        PageAndJuzTextWidget(
          index: index,
        )
      ],
    );
  }
}
