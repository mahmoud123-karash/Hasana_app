import 'package:flutter/foundation.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/services/notification_service.dart';
import 'package:quran_app/core/utils/salwat_notifications.dart';

void setSalwatNotifications() {
  String adhan = cache_helper.getData(key: 'adhan') ?? 'default';
  late bool s1 = cache_helper.getData(key: 's1') ?? true;
  late bool s2 = cache_helper.getData(key: 's2') ?? true;
  late bool s3 = cache_helper.getData(key: 's3') ?? true;
  late bool s4 = cache_helper.getData(key: 's4') ?? true;
  late bool s5 = cache_helper.getData(key: 's5') ?? true;
  if (s1) {
    fajrNotification(adhan);
  }
  if (s2) {
    dhuhrNotification(adhan);
  }
  if (s3) {
    asrNotification(adhan);
  }
  if (s4) {
    maghribNotification(adhan);
  }
  if (s5) {
    ishaNotification(adhan);
  }
}

void setAzkarNotification() {
  bool a1 = cache_helper.getData(key: 'a1') ?? true;
  bool a2 = cache_helper.getData(key: 'a2') ?? true;

  if (a1) {
    NotificationService().scheduleDailyNotification(
      id: 0,
      title: 'أذكار الصباح',
      body: 'موعد قراءة الأذكار',
      hour: 7,
      minute: 0,
      second: 0,
    );
    if (kDebugMode) {
      print('a1');
    }
  }
  if (a2) {
    NotificationService().scheduleDailyNotification(
      id: 1,
      title: 'أذكار المساء',
      body: 'موعد قراءة الأذكار',
      hour: 16,
      minute: 30,
      second: 0,
    );
    if (kDebugMode) {
      print('a2');
    }
  }
}

void mainNotification() {
    setAzkarNotification();
  double cachedLatitude = cache_helper.getData(key: 'latitude') ?? 0.0;
  if (cachedLatitude != 0.0) {
    setSalwatNotifications();
  }
}
