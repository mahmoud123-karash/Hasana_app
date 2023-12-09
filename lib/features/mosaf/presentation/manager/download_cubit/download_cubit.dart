import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/mosaf/presentation/manager/download_cubit/download_states.dart';

class DownloadCubit extends Cubit<DownloadStates> {
  DownloadCubit() : super(InitialDownloadState());
  static DownloadCubit get(context) => BlocProvider.of(context);

  void dowmload() {
    emit(LoadingDownloadState());
  }
}
