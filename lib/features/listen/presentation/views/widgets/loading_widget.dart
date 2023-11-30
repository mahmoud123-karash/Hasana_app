import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/shared/assets.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/reciter_item_widge.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [thirdColor!, secondColor!],
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 10 / 11,
        ),
        itemCount: 20,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: ReciterItemWidget(
            text: '',
            image: Assets.images1,
            sText: '',
            id: 0,
          ),
        ),
      ),
    );
  }
}
