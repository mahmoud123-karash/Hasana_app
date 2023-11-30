import 'package:dartz/dartz.dart';
import 'package:quran_app/features/notification/data/models/notification_model.dart';

abstract class NotificationRepo {
  Future<Either<String, List<NotificationModel>>> getNotification();
}
