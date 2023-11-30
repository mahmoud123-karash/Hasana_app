import 'package:flutter/material.dart';
import 'package:quran_app/core/shared/lists.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/juz_item_widget.dart';

class JuzListViewWidget extends StatefulWidget {
  const JuzListViewWidget({super.key});

  @override
  State<JuzListViewWidget> createState() => _JuzListViewWidgetState();
}

class _JuzListViewWidgetState extends State<JuzListViewWidget> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const PageStorageKey<String>('pageOne'),
      controller: scrollController,
      findChildIndexCallback: (key) {
        return null;
      },
      physics: const BouncingScrollPhysics(),
      itemCount: 30,
      itemBuilder: (context, index) => JuzItemWidget(
        text: juzNames[index],
        juzNumber: index + 1,
      ),
    );
  }
}
