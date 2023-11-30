import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/shared/assets.dart';
import 'package:shimmer/shimmer.dart';

class UrlLoadingWidget extends StatelessWidget {
  const UrlLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [secondColor!, thirdColor!],
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 40,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            width: size(context).width,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(Assets.images6),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        itemCount: 20,
      ),
    );
  }
}
