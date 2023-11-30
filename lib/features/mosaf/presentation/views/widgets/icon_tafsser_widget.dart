import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';

class IconTafsserWidget extends StatelessWidget {
  const IconTafsserWidget({super.key, required this.icon, required this.ontap});
  final IconData icon;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      hoverColor: gColor,
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: thirdColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
