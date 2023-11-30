import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../services/notification_service.dart';

FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

void subscribeToTopic() async {
  await firebaseMessaging.subscribeToTopic('noti');
  if (kDebugMode) {
    print('sub');
  }
}

void unSubscribeToTopic() async {
  await firebaseMessaging.unsubscribeFromTopic('noti');
  if (kDebugMode) {
    print('unsub');
  }
}

void gettoken() async {
  var token = await firebaseMessaging.getToken();
  if (kDebugMode) {
    print(token);
  }
}

void initialFMessage(initialMessage) {
  FirebaseMessaging.instance.getInitialMessage().then((value) {
    initialMessage = value?.data.toString();
  });
}

void onMessage() {
  FirebaseMessaging.onMessage.listen(
    (message) {
      NotificationService().showOnNotification(
        id: 10,
        title: message.notification!.title ?? '',
        body: message.notification!.body ?? '',
      );
    },
  );
}
