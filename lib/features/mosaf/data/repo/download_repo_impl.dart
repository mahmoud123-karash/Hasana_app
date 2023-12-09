import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/errors/failure.dart';
import 'package:quran_app/features/mosaf/data/data_sources/download_remote_data_source.dart';
import 'package:quran_app/features/mosaf/domain/repo/download_repo.dart';

class DownloadRepoImpl extends DownLoadRepo {
  final DownloadRemoteDataSource downloadRemoteDataSource;

  DownloadRepoImpl(this.downloadRemoteDataSource);
  @override
  Future<Either<Failure, String>> downloadImage({
    required String url,
    required String path,
  }) async {
    try {
   
      String filePath = await downloadRemoteDataSource.download(
        url: url,
        path: path,
      );
    
      return right(filePath);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.FromDioErorr(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
