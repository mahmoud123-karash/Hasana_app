import 'package:quran_app/features/notification/data/models/notification_model.dart';

abstract class NotificationStates {}

class InitialNotificationStates extends NotificationStates {}

class LoadingGetNotificationStates extends NotificationStates {}

class SuccessGetNotificationStates extends NotificationStates {
  final List<NotificationModel> notifications;

  SuccessGetNotificationStates(this.notifications);
}

class ErrorGetNotificationStates extends NotificationStates {
  final String message;

  ErrorGetNotificationStates(this.message);
}
