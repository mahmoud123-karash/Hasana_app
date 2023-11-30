import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/home/domain/repo/home_repo.dart';
import 'package:quran_app/features/home/presentation/manager/home_cubit.dart';
import 'package:quran_app/features/home/presentation/views/widgets/ayat_row_widget.dart';
import 'package:quran_app/features/home/presentation/views/widgets/share_ayat_widget.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

class AyatDayWidget extends StatelessWidget {
  const AyatDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int randomSurah = cache_helper.getData(key: 'randomS') ?? 1;
    int randomAyah = cache_helper.getData(key: 'randomA') ?? 1;
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepo()),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: secondColor),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              AyatRowWidget(randomAyah: randomAyah, randomSurah: randomSurah),
              const SizedBox(
                height: 10,
              ),
              Text(
                quran.getVerse(
                  randomSurah,
                  randomAyah,
                  verseEndSymbol: true,
                ),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              ShareAyatWidget(
                text: quran.getVerse(randomSurah, randomAyah),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
