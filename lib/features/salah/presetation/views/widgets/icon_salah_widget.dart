import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';

class IconSalahWidget extends StatelessWidget {
  const IconSalahWidget({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: blackColor!,
    );
  }
}
