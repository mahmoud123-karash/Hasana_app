import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/errors/failure.dart';
import 'package:quran_app/features/listen/data/data_source/reciter_local_data_source.dart';
import 'package:quran_app/features/listen/data/data_source/reciter_remote_data_source.dart';
import 'package:quran_app/features/listen/domain/entites/reciter_entity.dart';
import 'package:quran_app/features/listen/domain/repo/reciter_repo.dart';

class ReciterRepoImpl extends ReciterRepo {
  final ReciterRemoteDataSource reciterRemoteDataSource;
  final ReciterLocalDataSource reciterLocalDataSource;

  ReciterRepoImpl(this.reciterRemoteDataSource, this.reciterLocalDataSource);
  @override
  Future<Either<Failure, List<ReciterEntity>>> getReciterData() async {
    try {
      List<ReciterEntity> localReciters =
          reciterLocalDataSource.getReciterLocalData();
      if (localReciters.isNotEmpty) {
        return right(localReciters);
      }
      List<ReciterEntity> remoteReciters =
          await reciterRemoteDataSource.getReciterData();

      return right(remoteReciters);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.FromDioErorr(e));
      } else if (e is HiveError) {
        return left(HiveError.FromHiveErorr(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
