import 'package:flutter/material.dart';

class ProgressDownloadWidget extends StatelessWidget {
  const ProgressDownloadWidget({super.key, required this.progress});
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(
          value: progress,
        ),
        Text(
          "${(progress * 100).toStringAsFixed(0)}%",
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
