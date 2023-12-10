import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/verse_text_widget.dart';

import '../../../../../core/contants/constants.dart';
import '../../../domain/entities/page_data_entity.dart';
import 'aya_num_tafsser_widget.dart';
import 'copy_text_row_widget.dart';
import 'tafsser_spacer_widget.dart';

class TAfsserItemWidget extends StatelessWidget {
  const TAfsserItemWidget({
    super.key,
    required this.data,
    required this.firstVerse,
    required this.lastVerse,
  });
  final PageDataEntity data;
  final int firstVerse;
  final int lastVerse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          AyaNumTafsserWidget(
            verseNum: data.aya!,
            surahName: data.suraName!,
            firstVerse: firstVerse,
            lastVerse: lastVerse,
          ),
          const SizedBox(
            height: 25,
          ),
          VerseTextWidget(
            text: data.textVerse!,
            color:
                cache_helper.getData(key: 'isdark') ? whiteColor! : blackColor!,
          ),
          const TafsserSpacerWidget(),
          VerseTextWidget(
            text: data.tafsserVerse!,
            color:
                cache_helper.getData(key: 'isdark') ? Colors.white60 : gColor!,
          ),
          const SizedBox(
            height: 15,
          ),
          CopyTextRowWidget(
            tafsserText: data.tafsserVerse!,
            verseText: data.textVerse!,
          ),
        ],
      ),
    );
  }
}
