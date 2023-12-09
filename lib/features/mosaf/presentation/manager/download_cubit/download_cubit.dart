import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/mosaf/domain/repo/download_repo.dart';
import 'package:quran_app/features/mosaf/presentation/manager/download_cubit/download_states.dart';

class DownloadCubit extends Cubit<DownloadStates> {
  DownloadCubit(this.downLoadRepo) : super(InitialDownloadState());
  static DownloadCubit get(context) => BlocProvider.of(context);

  final DownLoadRepo downLoadRepo;
  int length = 0;
  void dowmload() async {
    if (length != 604) {
      List<String> images = [];
      emit(LoadingDownloadState(0));
      for (var i = 1; i <= 604; i++) {
        var result = await downLoadRepo.downloadImage(
          url:
              'https://raw.githubusercontent.com/mahmoud123-karash/Quran-App-Data/main/quran_images/$i.png',
          path: 'qimage$i.png',
        );

        result.fold(
          (failure) {
            emit(ErrorDownloadState(failure.message));
          },
          (imagePath) {
            images.add(imagePath);
            emit(LoadingDownloadState(i));
          },
        );
      }
      length = 604;
      emit(SuccessDownloadState(images));
    }
  }
}
