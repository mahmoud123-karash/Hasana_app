import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/home/presentation/views/widgets/home_audio_image_widget.dart';
import 'package:quran_app/features/home/presentation/views/widgets/home_paly_and_skip_widget.dart';

class HomeAudioWidget extends StatelessWidget {
  const HomeAudioWidget(
      {super.key,
      required this.playTap,
      required this.skipNextTap,
      required this.skipPreviousTap,
      required this.isplay,
      required this.image,
      required this.stext});
  final VoidCallback playTap;
  final VoidCallback skipNextTap;
  final VoidCallback skipPreviousTap;
  final bool isplay;
  final String image;
  final String stext;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: blackColor),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            HomeAudioImageWidget(image: image),
            const SizedBox(
              width: 25,
            ),
            Column(
              children: [
                Text(
                  "سورة $stext",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: whiteColor,
                  ),
                ),
                PalyAndSkipWidget(
                  playTap: playTap,
                  skipNextTap: skipNextTap,
                  skipPreviousTap: skipPreviousTap,
                  isplay: isplay,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
