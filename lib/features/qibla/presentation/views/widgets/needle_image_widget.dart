import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/shared/assets.dart';

class NeedleImageWidget extends StatelessWidget {
  const NeedleImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.imagesNeedle,
      fit: BoxFit.contain,
      height: 300,
      alignment: Alignment.center,
    );
  }
}
