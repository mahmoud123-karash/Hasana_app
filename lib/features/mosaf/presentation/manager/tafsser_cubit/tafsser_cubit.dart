import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/features/mosaf/domain/entities/page_data_entity.dart';
import 'package:quran_app/features/mosaf/domain/repo/tafsser_repo.dart';
import 'package:quran_app/features/mosaf/presentation/manager/tafsser_cubit/tafsser_states.dart';

import '../../../data/models/tafsser_model.dart';

class TafsserCubit extends Cubit<TafsserStates> {
  TafsserCubit(this.tafsserRepo) : super(InitialTafsserState());
  static TafsserCubit get(context) => BlocProvider.of(context);

  final TafsserRepo tafsserRepo;

  List<TafsserModel> tafsserList = [];
  void getTafsserData() async {
    if (tafsserList.isEmpty) {
      emit(LoadingGetTafsserState());
      tafsserList = await tafsserRepo.readTafsserjson();
      emit(SuccessGetTafsserState());
    }
  }

  List<PageDataEntity> data = [];
  void getPageTafsserData({required int page}) {
    data.clear();
    for (int i = 0; i < getPageData(page).length; i++) {
      for (int v = getPageData(page)[i]['start'];
          v <= getPageData(page)[i]['end'];
          v++) {
        for (var tafsser in tafsserList) {
          if (tafsser.sura == getPageData(page)[i]['surah'] &&
              tafsser.aya == v) {
            var tafssser = PageDataEntity(
              suraName: getSurahNameArabic(getPageData(page)[i]['surah']),
              aya: v,
              tafsserVerse: tafsser.text,
              textVerse: getVerse(
                getPageData(page)[i]['surah'],
                v,
                verseEndSymbol: true,
              ),
            );
            data.add(tafssser);
          }
        }
      }
    }
  }
}
