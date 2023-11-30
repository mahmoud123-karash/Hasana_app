import 'package:dartz/dartz.dart';
import 'package:quran_app/core/errors/failure.dart';
import 'package:quran_app/features/listen/data/models/audio_model/audio_model.dart';

abstract class AudioRepo {
  Future<Either<Failure, List<AudioModel>>> getAudioFiles({required int id});
}
