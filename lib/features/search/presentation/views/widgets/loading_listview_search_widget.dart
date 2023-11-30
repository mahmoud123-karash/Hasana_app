import 'package:flutter/material.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/features/search/data/models/verse_model.dart';
import 'package:quran_app/features/search/presentation/views/widgets/verse_item_widget.dart';

class LoadingLiatviewSearchWidget extends StatelessWidget {
  const LoadingLiatviewSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => VerseItemWidget(
          verse: VerseModel(
            verseNum: 1,
            surahNum: 5,
            verseText: getVerse(2, 10),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 12,
        ),
        itemCount: 20,
      ),
    );
  }
}
