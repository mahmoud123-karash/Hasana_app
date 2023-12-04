import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_app/features/listen/presentation/manager/audio_cubit/audio_states.dart';
import '../../../../../core/shared/components.dart';
import '../../../domain/use_cases/download_use_case.dart';

class AudioCubit extends Cubit<AudioStates> {
  AudioCubit(this.downloadUseCase) : super(InitialAudioState());
  static AudioCubit get(context) => BlocProvider.of(context);

  final DownloadUseCase downloadUseCase;

  int index = 150;
  List<String> isExits = [];
  void getFilePath({required int id}) async {
    isExits.clear();
    for (int i = 0; i < 114; i++) {
      File(
        '${(await getTemporaryDirectory()).path}$i $id',
      ).exists().then((value) {
        if (value) {
          isExits.add('$i$id');
        }
      });
    }
    emit(LoadingGetpathAudioState());
  }

  bool isDownloading = false;
  double progress = 0.0;
  void downloadAudio({
    required int surahIndex,
    required int id,
    required BuildContext context,
  }) async {
    isDownloading = true;
    emit(LoadingDownloadAudioState());
    var result = await downloadUseCase.download(
      id: id,
      surahIndex: surahIndex,
      onReceiveProgress: (count, total) {
        progress = (count / total);
        emit(LoadingDownloadAudioState());
      },
    );

    result.fold((l) {
      emit(ErrorDownloadAudioState(l.message));
    }, (r) {
      if (kDebugMode) {
        print(r);
      }
      isDownloading = false;
      progress = 0.0;
      mysnackbar(context: context, text: 'تم التنزيل بنجاح');
      emit(SuccessDownloadAudioState(r));
    });
  }
}
