import 'package:flutter/material.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/core/quran_data/quran_services.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/page_text_data_widget.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/save_mark_icon_widget.dart';
import 'fahres_icon_widget.dart';
import 'search_icon_widget.dart';

class PageDataWidget extends StatelessWidget {
  const PageDataWidget({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 22,
      ),
      child: Row(
        children: [
          const FahresIconWidget(),
          const Spacer(),
          if (getPageData(index + 1).length != 3)
            const PageTextDataWidget(
              text: 'سورة',
            ),
          if (getPageData(index + 1).length != 3)
            const SizedBox(
              width: 2,
            ),
          PageTextDataWidget(
            text: getNameSurah(index + 1),
          ),
          const Spacer(),
          const SaveMarkItemWidget(),
          const SearchIconWIdget(),
        ],
      ),
    );
  }
}
