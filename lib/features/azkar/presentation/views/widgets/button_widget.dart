import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.icon,
      required this.color,
      required this.onpressed});
  final IconData icon;
  final Color color;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: color),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
