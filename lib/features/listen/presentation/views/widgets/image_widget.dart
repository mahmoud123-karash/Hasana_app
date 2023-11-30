import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size(context).width / 3,
      backgroundImage: AssetImage(
        image,
      ),
    );
  }
}
