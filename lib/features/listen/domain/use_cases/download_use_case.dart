import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_app/core/api/dio_helper.dart';
import 'package:quran_app/core/errors/failure.dart';
import 'package:quran_app/features/listen/data/models/audio_model/audio_model.dart';
import 'package:quran_app/features/listen/domain/repo/audio_repo.dart';

abstract class UseCase {
  Future<Either<Failure, String>> download({
    required int id,
    required int surahIndex,
    required Function(int, int) onReceiveProgress,
  });
}

class DownloadUseCase extends UseCase {
  final AudioRepo audioRepo;
  final DioHelper dioHelper;

  DownloadUseCase(this.audioRepo, this.dioHelper);
  @override
  Future<Either<Failure, String>> download({
    required int id,
    required int surahIndex,
    required Function(int, int) onReceiveProgress,
  }) async {
    List<AudioModel> urls = [];
    Failure? failure;

    if (urls.isEmpty) {
      var result = await audioRepo.getAudioFiles(id: id);
      result.fold((f) {
        failure = f;
      }, (l) {
        urls = l;
      });
    }
    String filePath = '${(await getTemporaryDirectory()).path}$surahIndex $id';
    await dioHelper.downloadAudio(
      uri: urls[surahIndex].audioUrl!,
      filePath: filePath,
      onReceiveProgress: onReceiveProgress,
    );
    if (failure != null) {
      return left(failure!);
    } else {
      return right(filePath);
    }
  }
}
