import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/azkar/presentation/views/widgets/azkar_grid_view_widget.dart';
import 'package:shimmer/shimmer.dart';

class AzkarLoadingWidget extends StatelessWidget {
  const AzkarLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [secondColor!, thirdColor!],
      ),
      child: const AzkarGridViewWidget(azkar: {}),
    );
  }
}
