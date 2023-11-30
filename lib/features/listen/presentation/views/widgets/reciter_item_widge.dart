import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/features/listen/presentation/views/files_audio_screen.dart';

class ReciterItemWidget extends StatelessWidget {
  const ReciterItemWidget(
      {super.key,
      required this.text,
      required this.image,
      required this.sText,
      required this.id});
  final String text;
  final String image;
  final String sText;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (id != 0) {
          if (id == 8) {
            myToast(
              message: 'قريبًا',
              gravity: ToastGravity.CENTER,
            );
          } else {
            navigatorTo(
              context,
              FilesAudioScreen(
                id: id,
                reciterName: text,
                image: image,
                style: sText == '' ? '' : sText,
              ),
            );
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: secondColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              const Spacer(),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              Text(
                sText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: myColor,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
