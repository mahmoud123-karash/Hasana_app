import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/search/presentation/manager/search_cubit.dart';
import 'package:quran_app/features/search/presentation/manager/search_states.dart';
import 'package:quran_app/features/search/presentation/views/widgets/verse_number_widget.dart';

import 'listview_verse_search_widget.dart';
import 'search_textfield_widget.dart';

class SerachPageWidget extends StatelessWidget {
  const SerachPageWidget(
      {super.key,
      required this.controller,
      required this.cubit,
      required this.state,});
  final TextEditingController controller;
  final SearchCubit cubit;
  final SearchStates state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchTextFiledWidget(controller: controller),
        if (controller.text != '')
          VerseNumberWidget(
            verseCount: cubit.sVerses.length,
          ),
        const SizedBox(
          height: 10,
        ),
        controller.text == ''
            ? Center(
                child: Icon(
                  Icons.search_rounded,
                  size: 30,
                  color: gColor,
                ),
              )
            : state is LoadingGetVersesState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListViewVerseSearchWidget(
                    verses: cubit.sVerses,
                  ),
      ],
    );
  }
}
