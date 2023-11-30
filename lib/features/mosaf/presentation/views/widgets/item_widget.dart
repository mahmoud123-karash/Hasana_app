import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget(
      {super.key,
      required this.ontap,
      required this.text,
      required this.color,
      required this.tColor});
  final VoidCallback ontap;
  final String text;
  final Color color;
  final Color tColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.5,
          ),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 8,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: tColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
