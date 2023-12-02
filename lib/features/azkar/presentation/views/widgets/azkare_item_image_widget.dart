import 'package:flutter/material.dart';

import '../../../../../core/contants/constants.dart';

class AzkarItemImageWidget extends StatelessWidget {
  const AzkarItemImageWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: whiteColor,
      radius: 30,
      backgroundImage: AssetImage(
        image,
      ),
    );
  }
}
