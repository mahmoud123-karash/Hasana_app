// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran/quran.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/features/listen/presentation/manager/audio_cubit/audio_cubit.dart';
import 'package:quran_app/features/listen/presentation/views/player_screen.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/progress_download_builder_widget.dart';
import '../../../../../core/cache/save_data.dart';
import '../../../../../core/contants/constants.dart';

class ItemSurahWidget extends StatelessWidget {
  const ItemSurahWidget({
    super.key,
    required this.index,
    required this.image,
    required this.name,
    required this.cacheUrl,
    required this.isPlay,
    required this.id,
  });
  final int index;
  final String image;
  final String name;
  final int id;
  final String cacheUrl;
  final bool isPlay;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        AudioCubit.get(context).index = index;
        if (await File(
          '${(await getTemporaryDirectory()).path}$index $id',
        ).exists()) {
          if (AudioCubit.get(context).isDownloading) {
            mysnackbar(context: context, text: 'يرجي الإنتظار لإكمال التنزيل');
          } else {
            saveReciterImage(image);
            saveReciterName(name);
            saveSurahName(getSurahNameArabic(index + 1));
            navigatorTo(
                context, PlayerScreen(isHome: false, id: id, index: index));
          }
        } else {
          if (await InternetConnectionChecker().hasConnection) {
            AudioCubit.get(context).downloadAudio(
              surahIndex: index,
              id: id,
              context: context,
            );
          } else {
            mysnackbar(context: context, text: 'لا يوجد اتصال');
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: thirdColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                getVerseEndSymbol(index + 1),
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Text(
                Intl.getCurrentLocale() == 'ar'
                    ? getSurahNameArabic(index + 1)
                    : getSurahName(index + 1),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: textfamilyAus2,
                ),
              ),
              const Spacer(),
              ProgressDownloadBuilderWidget(
                index: index,
                isPlay: isPlay,
                id: id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
