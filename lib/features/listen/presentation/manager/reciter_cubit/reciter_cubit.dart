import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/listen/domain/repo/reciter_repo.dart';
import 'package:quran_app/features/listen/presentation/manager/reciter_cubit/reciter_states.dart';

class ReciterCubit extends Cubit<ReciterStates> {
  ReciterCubit(this.reciterRepo) : super(InitialReciterState());
  static ReciterCubit get(context) => BlocProvider.of(context);

  final ReciterRepo reciterRepo;
  void getReciterData() async {
    emit(LoadingGetReciterDataState());
    var data = await reciterRepo.getReciterData();
    data.fold((l) {
      emit(ErrorGetReciterDataState(l.message));
    }, (r) {
      emit(SuccessGetReciterDataState(r));
    });
  }
}
