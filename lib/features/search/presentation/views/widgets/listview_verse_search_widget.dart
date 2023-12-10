import 'package:flutter/material.dart';
import 'package:quran_app/features/search/data/models/verse_model.dart';

import 'verse_item_widget.dart';

class ListViewVerseSearchWidget extends StatelessWidget {
  const ListViewVerseSearchWidget({
    super.key,
    required this.verses,
  });
  final List<VerseModel> verses;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: ListView.separated(
          itemBuilder: (context, index) => VerseItemWidget(
            verse: verses[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 12,
          ),
          itemCount: verses.length,
        ),
      ),
    );
  }
}
