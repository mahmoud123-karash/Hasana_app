import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';

class CopyTextWidget extends StatelessWidget {
  const CopyTextWidget({
    super.key,
    required this.text,
    required this.ontap,
    required this.cColor,
    required this.tColor,
  });
  final String text;
  final VoidCallback ontap;
  final Color cColor;
  final Color tColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: myColor!,
          ),
          borderRadius: BorderRadius.circular(10),
          color: cColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: tColor,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                Icons.copy,
                color: tColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
