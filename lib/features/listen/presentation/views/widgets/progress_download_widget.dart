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
          progress.toStringAsFixed(2),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
