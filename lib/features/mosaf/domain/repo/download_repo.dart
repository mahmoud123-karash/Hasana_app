import 'package:dartz/dartz.dart';
import 'package:quran_app/core/errors/failure.dart';

abstract class DownLoadRepo {
  Future<Either<Failure, String>> downloadImage({
    required String url,
    required String path,
  });
}
