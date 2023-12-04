import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/Surah_list_view_widget.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/header_drawer_widget.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/juz_list_view_widget.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/mark_widget.dart';

class MosafDrawerWidget extends StatefulWidget {
  const MosafDrawerWidget({super.key});

  @override
  State<MosafDrawerWidget> createState() => _MosafDrawerWidgetState();
}

class _MosafDrawerWidgetState extends State<MosafDrawerWidget> {
  int? index;
  int? mark;
  @override
  void initState() {
    index = cache_helper.getData(key: 'sj') ?? 0;
    mark = cache_helper.getData(key: 'saveMark') ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: size(context).width - 120,
      child: PageStorage(
        bucket: pageBuket,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            if (mark != 0)
              MarkWidget(
                mark: mark ?? 0,
              ),
            const SizedBox(
              height: 15,
            ),
            HeaderDrawerWidget(
              index: index!,
              ontapS: () {
                setState(() {
                  index = 0;
                  saveSurahOrJuz(0);
                });
              },
              ontapJ: () {
                setState(() {
                  index = 1;
                  saveSurahOrJuz(1);
                });
              },
            ),
            Expanded(
              child: index == 1
                  ? const JuzListViewWidget()
                  : const SurahListViewWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
