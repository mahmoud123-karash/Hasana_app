import 'package:flutter/material.dart';
import 'package:quran_app/features/home/presentation/views/widgets/home_item_button_widget.dart';

class PalyAndSkipWidget extends StatelessWidget {
  const PalyAndSkipWidget(
      {super.key,
      required this.playTap,
      required this.skipNextTap,
      required this.skipPreviousTap,
      required this.isplay});
  final VoidCallback playTap;
  final VoidCallback skipNextTap;
  final VoidCallback skipPreviousTap;
  final bool isplay;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HomeItemButtonWidget(
          onTap: skipPreviousTap,
          icon: Icons.skip_next,
        ),
        const SizedBox(
          width: 8,
        ),
        HomeItemButtonWidget(
          onTap: playTap,
          icon: isplay ? Icons.pause : Icons.play_arrow,
        ),
        const SizedBox(
          width: 8,
        ),
        HomeItemButtonWidget(
          onTap: skipNextTap,
          icon: Icons.skip_previous,
        )
      ],
    );
  }
}
