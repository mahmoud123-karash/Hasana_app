import 'package:flutter/material.dart';

class HomeItemButtonWidget extends StatelessWidget {
  const HomeItemButtonWidget(
      {super.key, required this.onTap, required this.icon});
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon),
      iconSize: 30,
    );
  }
}
