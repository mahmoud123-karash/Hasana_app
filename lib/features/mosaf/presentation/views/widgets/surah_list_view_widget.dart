// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'list_tile_surah_widget.dart';

class SurahListViewWidget extends StatelessWidget {
  const SurahListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const PageStorageKey<String>('pageTwo'),
      physics: const BouncingScrollPhysics(),
      itemCount: 114,
      itemBuilder: (context, index) {
        return ListTileSurahWidget(
          index: index,
        );
      },
    );
  }
}
