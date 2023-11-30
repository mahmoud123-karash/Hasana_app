import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/quran_data/juz_page.dart';
import 'package:quran_app/features/mosaf/presentation/manager/page_cubit/page_cubit.dart';

class JuzItemWidget extends StatelessWidget {
  const JuzItemWidget({
    super.key,
    required this.text,
    required this.juzNumber,
  });
  final String text;
  final int juzNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PageCubit.get(context)
            .goToPage(page: JuzPage.navigateToFirstPage(juzNumber));
        PageCubit.get(context).closeDrawer();
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 15,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: secondColor,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
