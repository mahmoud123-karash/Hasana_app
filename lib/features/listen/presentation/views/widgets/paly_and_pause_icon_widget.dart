import 'package:flutter/material.dart';

class PlayAndPauseIconWidget extends StatelessWidget {
  const PlayAndPauseIconWidget({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 30,
    );
  }
}
