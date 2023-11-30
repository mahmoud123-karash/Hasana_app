import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QiblaImageWidget extends StatelessWidget {
  const QiblaImageWidget({super.key, required this.width, required this.image});
  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: SvgPicture.asset(
        image,
      ),
    );
  }
}
