import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/mosaf/presentation/manager/tafsser_swiper_cubit/tafsser_swiper_states.dart';

class TafsserSwiperCubit extends Cubit<TafsserSwiperStates> {
  TafsserSwiperCubit() : super(InitialSwiperState());

  static TafsserSwiperCubit get(context) => BlocProvider.of(context);

  SwiperController swiperController = SwiperController();
  void incrementSwiper() {
    swiperController.next().then((value) {
      emit(SuccessIncrementState());
    }).catchError((error) {
      emit(ErrorIncrementState());
    });
  }

  void decrementSwiper() {
    swiperController.previous().then((value) {
      emit(SuccessDecrementState());
    }).catchError((error) {
      emit(ErrorDecrementState());
    });
  }
}
