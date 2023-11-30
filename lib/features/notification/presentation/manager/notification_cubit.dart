import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/notification/domain/repo/notification_repo.dart';
import 'package:quran_app/features/notification/presentation/manager/notification_states.dart';

class NotificationCubit extends Cubit<NotificationStates> {
  NotificationCubit(this.notificationRepo) : super(InitialNotificationStates());
  static NotificationCubit get(context) => BlocProvider.of(context);

  final NotificationRepo notificationRepo;

  int count = 0;
  void getNotification() async {
    emit(LoadingGetNotificationStates());
    var result = await notificationRepo.getNotification();

    result.fold((l) {
      emit(ErrorGetNotificationStates(l));
    }, (r) {
      count = r.length;
      emit(SuccessGetNotificationStates(r));
    });
  }
}
