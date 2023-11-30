import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/errors/failure.dart';
import 'package:quran_app/features/listen/data/data_source/audio_remote_data_source.dart';
import 'package:quran_app/features/listen/data/models/audio_model/audio_model.dart';
import 'package:quran_app/features/listen/domain/repo/audio_repo.dart';

class AudioRepoImpl extends AudioRepo {
  final AudioRemoteDataSource audioRemoteDataSource;

  AudioRepoImpl(this.audioRemoteDataSource);

  @override
  Future<Either<Failure, List<AudioModel>>> getAudioFiles(
      {required int id}) async {
    try {
      List<AudioModel> audioFiles =
          await audioRemoteDataSource.getRemoteAudioFiles(id: id);
      return right(audioFiles);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.FromDioErorr(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
