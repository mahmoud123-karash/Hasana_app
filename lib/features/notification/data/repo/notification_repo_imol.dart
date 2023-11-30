import 'package:dartz/dartz.dart';
import 'package:quran_app/features/notification/data/data_sources/notification_remote_data_source.dart';
import 'package:quran_app/features/notification/data/models/notification_model.dart';
import 'package:quran_app/features/notification/domain/repo/notification_repo.dart';

class NotificationRepoImpl extends NotificationRepo {
  final NotificationRemoteDataSource notificationRemoteDataSource;

  NotificationRepoImpl(this.notificationRemoteDataSource);
  @override
  Future<Either<String, List<NotificationModel>>> getNotification() async {
    try {
      List<NotificationModel> list =
          await notificationRemoteDataSource.getNitification();
      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }
}
