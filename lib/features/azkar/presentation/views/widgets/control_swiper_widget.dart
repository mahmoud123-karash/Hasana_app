// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/azkar/presentation/views/widgets/button_widget.dart';

class ControlSwiperWidget extends StatelessWidget {
  const ControlSwiperWidget(
      {super.key,
      required this.forwardSwiper,
      required this.backwardSwiper,
      required this.shareTap});
  final VoidCallback forwardSwiper;
  final VoidCallback backwardSwiper;
  final VoidCallback shareTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonWidget(
          icon: Icons.arrow_back_ios,
          color: Colors.red[400]!,
          onpressed: forwardSwiper,
        ),
        const SizedBox(
          width: 30,
        ),
        ButtonWidget(
          icon: Icons.arrow_forward_ios,
          color: Colors.indigo[400]!,
          onpressed: backwardSwiper,
        ),
        const SizedBox(
          width: 30,
        ),
        ButtonWidget(
          icon: Icons.share,
          color: myColor!,
          onpressed: shareTap,
        )
      ],
    );
  }
}
