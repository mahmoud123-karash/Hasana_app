import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/home/domain/repo/home_repo.dart';
import 'package:quran_app/features/home/presentation/manager/home_states.dart';
import 'package:quran_app/generated/l10n.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepo) : super(InitialHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  void shareAyahOfTheDay(
      {required String text, required BuildContext context}) async {
    emit(LoadingShareState());
    await homeRepo
        .shareAyahOfTheDay(
      title: S.of(context).title,
      text: text,
      linkUrl: appLink,
    )
        .then((value) {
      emit(SuccessShareState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorShareState());
    });
  }
}
