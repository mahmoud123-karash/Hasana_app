import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initiNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('app_icon');

    DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {},
    );

    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: initializationSettingsDarwin);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) async {},
    );
  }

  void cancelNotification(int notificationId) async {
    await flutterLocalNotificationsPlugin.cancel(notificationId);
  }

  Future dailyNotificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily id',
        'daily name',
        channelDescription: 'daily description',
        priority: Priority.high,
        playSound: true,
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(
        categoryIdentifier: 'thread_id',
        presentAlert: true,
      ),
    );
  }

  Future salatNotificationDetails({
    required String androidSound,
    required String iosSound,
    required String channelId,
  }) async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'salah notification channel $channelId',
        'salah notification channel name',
        channelDescription: 'salah notification description',
        priority: Priority.high,
        playSound: true,
        importance: Importance.max,
        sound: RawResourceAndroidNotificationSound(androidSound),
      ),
      iOS: DarwinNotificationDetails(
        categoryIdentifier: 'thread_id',
        presentAlert: true,
        sound: iosSound,
      ),
    );
  }

  Future<void> scheduleDailyNotification({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
    required int second,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      _nextInstanceOfTenAM(hour, minute, second),
      await dailyNotificationDetails(),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> scheduleSalahNotification({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
    required int second,
    required String androidSound,
    required String iosSound,
    required String channelId,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      _nextInstanceOfTenAM(hour, minute, second),
      await salatNotificationDetails(
        androidSound: androidSound,
        iosSound: iosSound,
        channelId: channelId,
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  tz.TZDateTime _nextInstanceOfTenAM(hour, minute, second) {
    DateTime dateTime = DateTime.now();

    final tz.TZDateTime now =
        tz.TZDateTime.now(tz.getLocation(dateTime.timeZoneName));
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.getLocation(dateTime.timeZoneName),
      now.year,
      now.month,
      now.day,
      hour,
      minute,
      second,
    );
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future showOnNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    return flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      await dailyNotificationDetails(),
    );
  }
}
