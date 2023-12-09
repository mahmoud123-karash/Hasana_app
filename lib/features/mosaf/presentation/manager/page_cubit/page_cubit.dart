import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/features/mosaf/presentation/manager/page_cubit/page_states.dart';
import 'package:quran_app/generated/l10n.dart';

class PageCubit extends Cubit<PageStates> {
  PageCubit() : super(IntialPageState());
  static PageCubit get(context) => BlocProvider.of(context);

  int index = 1000;

  void savePage(value) {
    index = value;
    savePageNumber(value + 1);
    emit(SavePageState());
  }

  void savePageMark(context) {
    int page = cache_helper.getData(key: 'pagenumber') ?? 1;
    int mark = cache_helper.getData(key: 'saveMark') ?? 0;

    if (mark == page) {
      cache_helper.removeData(key: 'saveMark');
      mysnackbar(context: context, text: S.of(context).saver);

      emit(RemoveMarkState());
    } else {
      saveMark(page);
      mysnackbar(context: context, text: S.of(context).saved);
      emit(SaveMarkState());
    }
  }

  final GlobalKey<ScaffoldState> mosafKey = GlobalKey<ScaffoldState>();
  void closeDrawer() {
    if (mosafKey.currentState!.isDrawerOpen) {
      mosafKey.currentState!.closeDrawer();
    }
  }

  void openDrawer() {
    if (!mosafKey.currentState!.isDrawerOpen) {
      mosafKey.currentState!.openDrawer();
    }
  }

  SwiperController swiperController = SwiperController();

  void goToPage({required int page}) {
    swiperController.move(page).then((value) {
      emit(GoTOPageState());
    });
  }
}
