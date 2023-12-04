import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/azkar/domain/repo/akar_details_repo.dart';
import 'package:quran_app/features/azkar/presentation/manager/swiper_cubit/swiper_states.dart';

class SwiperCubit extends Cubit<SwiperStates> {
  SwiperCubit(this.azkarDetailsRepo) : super(InitialSwiperState());
  static SwiperCubit get(context) => BlocProvider.of(context);
  final AzkarDetailsRepo azkarDetailsRepo;

  SwiperController swiperController = SwiperController();
  void incrementSwiper() {
    emit(LoadingIncrementState());
    swiperController.next().then((value) {
      emit(SuccessIncrementState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorIncrementState(error));
    });
  }

  void decrementSwiper() {
    emit(LoadingDecrementState());
    swiperController.previous().then((value) {
      emit(SuccessDecrementState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorDecrementState(error));
    });
  }

  void saveAzkarCIndex(index) {
    saveAzkarIndex(index);
    emit(SuccessSaveIndxeState());
  }

  void shareAzkarText(
      {required String text,
      required BuildContext context,
      required String title}) async {
    emit(LoadingShareState());
    await azkarDetailsRepo
        .shareAzkarText(
      title: title,
      text: text,
      linkUrl: appLink,
    )
        .then((value) {
      emit(SuccessShareState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorShareState(error));
    });
  }
}
