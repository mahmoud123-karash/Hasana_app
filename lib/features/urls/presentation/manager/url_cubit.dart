import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quran_app/features/urls/domain/repo/url_repo.dart';
import 'package:quran_app/features/urls/presentation/manager/url_states.dart';
import 'package:quran_app/generated/l10n.dart';

class UrlCubit extends Cubit<UrlStates> {
  UrlCubit(this.urlRepo) : super(InitialUrlState());
  static UrlCubit get(context) => BlocProvider.of(context);

  final UrlRepo urlRepo;

  void getUrls(context) async {
    emit(LoadingGetUrlState());
    await InternetConnectionChecker().hasConnection.then(
      (value) {
        if (value) {
          urlRepo.getUrls().then((value) {
            emit(SuccessGetUrlState(value));
          }).catchError((error) {
            if (kDebugMode) {
              print(error);
            }
            emit(ErrorGetUrlState(error.toString()));
          });
        } else {
          emit(ErrorGetUrlState(S.of(context).internet));
        }
      },
    );
  }
}
