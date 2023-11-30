import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/navbar/presentation/manager/navbar_cubit/navbar_states.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(InitialNavBarState());
  static NavBarCubit get(context) => BlocProvider.of(context);

  bool canPop = false;
  int initiaIndex = 0;
  void navigateBar(int index) {
    initiaIndex = index;
    emit(NavigateBarState());
  }
}
