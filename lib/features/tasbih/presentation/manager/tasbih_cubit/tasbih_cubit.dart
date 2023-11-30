import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/features/tasbih/data/models/tasbih_model.dart';
import 'package:quran_app/features/tasbih/domain/repo/tasbih_repo.dart';
import 'package:quran_app/features/tasbih/domain/use_cases/delete_tasbih_use_case.dart';
import 'package:quran_app/features/tasbih/domain/use_cases/update_tasbih_use_case.dart';
import 'package:quran_app/features/tasbih/presentation/manager/tasbih_cubit/tasbih_states.dart';
import 'package:quran_app/generated/l10n.dart';

import '../../../domain/use_cases/add_new_tasbih_use_case.dart';
import '../../../domain/use_cases/zero_count_tasabih_use_case.dart';

class TasbihCubit extends Cubit<TasbihStates> {
  TasbihCubit(
    this.tasbihRepo,
    this.addNewTasbihUseCase,
    this.deleteTasbihUseCase,
    this.updateTasbihUseCase,
    this.zeroCountTasabihUseCase,
  ) : super(InitialTasbihState());
  static TasbihCubit get(context) => BlocProvider.of(context);

  final TasbihRepo tasbihRepo;
  final AddNewTasbihUseCase addNewTasbihUseCase;
  final DeleteTasbihUseCase deleteTasbihUseCase;
  final UpdateTasbihUseCase updateTasbihUseCase;
  final ZeroCountTasabihUseCase zeroCountTasabihUseCase;

  String message(context) => S.of(context).messageE;
  bool isFirst = cache_helper.getData(key: 'isfirst') ?? false;

  void getTasabih() {
    emit(LoadingGetTasbihState());
    List<TasbihModel> tasabih = tasbihRepo.getTasbihs();
    emit(SuccessGetTasbihState(tasabih));
  }

  void addNewtasbih({
    required String name,
    required BuildContext context,
  }) {
    List<TasbihModel> tasabih = addNewTasbihUseCase.add(name: name);
    Navigator.pop(context);
    mysnackbar(context: context, text: S.of(context).add);
    emit(SuccessGetTasbihState(tasabih));
  }

  void deleteTasbih({
    required int index,
    required BuildContext context,
  }) {
    List<TasbihModel> tasabih = deleteTasbihUseCase.remove(index);
    mysnackbar(context: context, text: S.of(context).remove);
    emit(SuccessGetTasbihState(tasabih));
  }

  void updateCount({
    required int index,
    required int count,
  }) {
    List<TasbihModel> tasabih = updateTasbihUseCase.update(index, count);
    emit(SuccessGetTasbihState(tasabih));
  }

  List<String> defaultTasabih = [
    'سبحان الله',
    'الله أكبر',
    'لا إله إلا الله',
  ];

  void addDeaultTasabih() {
    List<TasbihModel> tasabih = tasbihRepo.getTasbihs();
    if (!isFirst && tasabih.isEmpty) {
      saveIsfirstOrNot(true);
      for (var element in defaultTasabih) {
        addNewTasbihUseCase.add(name: element);
      }
      emit(SuccessGetTasbihState(tasabih));
    }
  }

  int? cIndex;
  TasbihModel model(index) {
    List<TasbihModel> tasabih = tasbihRepo.getTasbihs();
    if (tasabih.isNotEmpty && tasabih.length > index && index != 100000000000) {
      return tasabih[index!];
    } else {
      return TasbihModel('اختر تسبيحتك', 0);
    }
  }

  void deleteAllTasabih(context) {
    List<TasbihModel> tasabih = tasbihRepo.getTasbihs();
    if (tasabih.isNotEmpty) {
      tasbihRepo.deleteAllTasabih();
      cIndex = 100000000;
      emit(SuccessGetTasbihState([]));
    } else {
      mysnackbar(context: context, text: message(context));
    }
  }

  void makeCountsZero(context) {
    List<TasbihModel> tasabih = tasbihRepo.getTasbihs();
    if (tasabih.isNotEmpty) {
      List<TasbihModel> tasabih = zeroCountTasabihUseCase.update();
      emit(SuccessGetTasbihState(tasabih));
    } else {
      mysnackbar(context: context, text: message(context));
    }
  }
}
