import 'package:quran_app/features/listen/domain/entites/reciter_entity.dart';

abstract class ReciterStates {}

class InitialReciterState extends ReciterStates {}

class LoadingGetReciterDataState extends ReciterStates {}

class SuccessGetReciterDataState extends ReciterStates {
  final List<ReciterEntity> reciters;

  SuccessGetReciterDataState(this.reciters);
}

class ErrorGetReciterDataState extends ReciterStates {
  final String error;

  ErrorGetReciterDataState(this.error);
}
