import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/search/presentation/views/widgets/search_textfield_widget.dart';
import 'package:quran_app/features/search/presentation/views/widgets/verse_number_widget.dart';
import 'package:shimmer/shimmer.dart';

import 'loading_listview_search_widget.dart';

class SearchLoadingWdget extends StatelessWidget {
  const SearchLoadingWdget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [secondColor!, thirdColor!],
      ),
      child: Column(
        children: [
          SearchTextFiledWidget(controller: TextEditingController()),
          const VerseNumberWidget(verseCount: 0),
          const SizedBox(
            height: 20,
          ),
          const LoadingLiatviewSearchWidget(),
        ],
      ),
    );
  }
}
