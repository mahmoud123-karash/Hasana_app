import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quran_app/core/api/dio_helper.dart';
import 'package:quran_app/features/listen/data/data_source/reciter_local_data_source.dart';
import 'package:quran_app/features/listen/data/data_source/reciter_remote_data_source.dart';
import 'package:quran_app/features/listen/data/repo/reciter_repo_impl.dart';
import 'package:quran_app/features/notification/data/repo/notification_repo_imol.dart';
import 'package:quran_app/features/tasbih/data/data_sources/tasbih_local_data_source.dart';
import 'package:quran_app/features/tasbih/data/repo/tasbih_repo_impl.dart';
import 'package:quran_app/features/tasbih/domain/use_cases/delete_tasbih_use_case.dart';
import 'package:quran_app/features/tasbih/domain/use_cases/update_tasbih_use_case.dart';
import '../../features/listen/data/data_source/audio_remote_data_source.dart';
import '../../features/listen/data/repo/audio_repo_imol.dart';
import '../../features/listen/domain/use_cases/download_use_case.dart';
import '../../features/mosaf/data/data_sources/download_remote_data_source.dart';
import '../../features/mosaf/data/repo/download_repo_impl.dart';
import '../../features/notification/data/data_sources/notification_remote_data_source.dart';
import '../../features/tasbih/domain/use_cases/add_new_tasbih_use_case.dart';
import '../../features/tasbih/domain/use_cases/zero_count_tasabih_use_case.dart';

GetIt getIt = GetIt.instance;
void setLocator() {
  getIt.registerSingleton<DioHelper>(
    DioHelper(
      Dio(),
    ),
  );
  getIt.registerSingleton<ReciterRepoImpl>(
    ReciterRepoImpl(
      ReciterRemoteDataSourceImpl(
        getIt.get<DioHelper>(),
      ),
      ReciterLocalDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<AudioRepoImpl>(
    AudioRepoImpl(
      AudioRemoteDataSourceImpl(
        getIt.get<DioHelper>(),
      ),
    ),
  );

  getIt.registerSingleton<TasbihRepoImpl>(
    TasbihRepoImpl(
      TasbihLocalDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<AddNewTasbihUseCase>(
    AddNewTasbihUseCase(
      getIt.get<TasbihRepoImpl>(),
    ),
  );

  getIt.registerSingleton(
    DeleteTasbihUseCase(
      getIt.get<TasbihRepoImpl>(),
    ),
  );
  getIt.registerSingleton<UpdateTasbihUseCase>(
    UpdateTasbihUseCase(
      getIt.get<TasbihRepoImpl>(),
    ),
  );

  getIt.registerSingleton<ZeroCountTasabihUseCase>(
    ZeroCountTasabihUseCase(
      getIt.get<TasbihRepoImpl>(),
      UpdateTasbihUseCase(
        getIt.get<TasbihRepoImpl>(),
      ),
    ),
  );

  getIt.registerSingleton<DownloadUseCase>(
    DownloadUseCase(
      getIt.get<AudioRepoImpl>(),
      getIt.get<DioHelper>(),
    ),
  );

  getIt.registerSingleton<NotificationRepoImpl>(
    NotificationRepoImpl(
      NotificationRemoteDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<DownloadRepoImpl>(
    DownloadRepoImpl(
      DownloadRemoteDataSourceImpl(
        getIt.get<DioHelper>(),
      ),
    ),
  );
}
