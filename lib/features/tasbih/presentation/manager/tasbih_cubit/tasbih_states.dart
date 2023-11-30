import 'package:quran_app/features/tasbih/data/models/tasbih_model.dart';

abstract class TasbihStates {}

class InitialTasbihState extends TasbihStates {}

class LoadingGetTasbihState extends TasbihStates {}

class SuccessGetTasbihState extends TasbihStates {
  final List<TasbihModel> tasabih;

  SuccessGetTasbihState(this.tasabih);
}
