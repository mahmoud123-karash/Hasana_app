import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/azkar/domain/repo/azkar_repo.dart';
import 'package:quran_app/features/azkar/presentation/manager/azkar_cubit/azkar_states.dart';

class AzkarCubit extends Cubit<AzkarStates> {
  AzkarCubit(this.azkarRepo) : super(InitialAzkarState());
  static AzkarCubit get(context) => BlocProvider.of(context);

  final AzkarRepo azkarRepo;
  void readAzkarFromJson() {
    emit(LoadingReadAzkarState());
    azkarRepo.readAzkarFromJson().then((value) {
      Map data = json.decode(value);
      emit(SuccessReadAzkarState(data));
    }).catchError((error) {
      emit(ErrorReadAzkarState(error));
    });
  }
}
