import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quran_app/features/notification/data/models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNitification();
}

class NotificationRemoteDataSourceImpl extends NotificationRemoteDataSource {
  @override
  Future<List<NotificationModel>> getNitification() async {
    List<NotificationModel> notifications = [];
    var data =
        await FirebaseFirestore.instance.collection('notifications').get();
    for (var element in data.docs) {
      notifications.add(
        NotificationModel.fromJson(
          element.data(),
        ),
      );
    }
    return notifications;
  }
}
