import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_app/features/search/data/models/verse_model.dart';
import 'package:quran_app/features/search/presentation/manager/search_states.dart';

import '../../../../core/services/normilze_text_service.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(InitialSearchState());

  static SearchCubit get(context) => BlocProvider.of(context);

  List<VerseModel> verses = [];
  void getVerses() {
    if (verses.isEmpty) {
      for (int i = 1; i <= 114; i++) {
        for (int v = 1; v <= quran.getVerseCount(i); v++) {
          VerseModel verse = VerseModel(
            verseNum: v,
            surahNum: i,
            verseText: quran.getVerse(i, v, verseEndSymbol: true),
          );
          verses.add(verse);
        }
      }
      emit(LoadingSearchState());
      if (kDebugMode) {
        print(verses.length);
      }
    }
  }

  List<VerseModel> sVerses = [];
  void search({required String searchValue}) {
    sVerses.clear();
    emit(LoadingSearchState());
    List<VerseModel> searchResults = verses.where((element) {
      return normalise(element.verseText).contains(searchValue);
    }).toList();

    sVerses.addAll(searchResults);
    emit(SuccessSearchState());
  }
}
