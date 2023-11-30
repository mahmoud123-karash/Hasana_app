import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/salah/presetation/views/widgets/salah_content_widget.dart';
import 'package:shimmer/shimmer.dart';

class SalahLoadingWidget extends StatelessWidget {
  const SalahLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer(
        gradient: LinearGradient(
          colors: [thirdColor!, secondColor!],
        ),
        child: const SalahContentWidget(
          times: [
            '1',
            '2',
            '3',
            '5',
            '6',
            '4',
            '8',
            '9',
            '10',
            '11',
            '10',
          ],
        ),
      ),
    );
  }
}
