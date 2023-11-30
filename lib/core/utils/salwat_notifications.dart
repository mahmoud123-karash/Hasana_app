import 'package:adhan/adhan.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../services/notification_service.dart';

double cachedLatitude = cache_helper.getData(key: 'latitude') ?? 0.0;
double cachedLongitude = cache_helper.getData(key: 'longitude') ?? 0.0;

PrayerTimes getMyCoordinate() {
  final myCoordinates = Coordinates(cachedLatitude, cachedLongitude);
  final params = CalculationMethod.egyptian.getParameters();
  final prayerTimes = PrayerTimes.today(myCoordinates, params);
  return prayerTimes;
}

void fajrNotification(adhan) {
  PrayerTimes prayer = getMyCoordinate();
  int id = 2;
  String title = 'صلاة الفجر';
  String body = DateFormat.jm().format(prayer.fajr);
  var hour = prayer.fajr.hour;
  var minute = prayer.fajr.minute;
  var second = prayer.fajr.second;
  if (adhan == 'default') {
    NotificationService().scheduleDailyNotification(
      id: id,
      title: title,
      body: body,
      hour: hour,
      minute: minute,
      second: second,
    );
  } else {
    NotificationService().scheduleSalahNotification(
      id: id,
      title: title,
      body: body,
      hour: hour,
      minute: minute,
      second: second,
      androidSound: 'fajr',
      iosSound: 'fajr',
      channelId: 'fajr',
    );
  }
  if (kDebugMode) {
    print(id);
  }
}

void dhuhrNotification(adhan) {
  PrayerTimes prayer = getMyCoordinate();
  int id = 3;
  String title = 'صلاة الظهر';
  String body = DateFormat.jm().format(prayer.dhuhr);
  var hour = prayer.dhuhr.hour;
  var minute = prayer.dhuhr.minute;
  var second = prayer.dhuhr.second;
  if (adhan == 'default') {
    NotificationService().scheduleDailyNotification(
      id: id,
      title: title,
      body: body,
      hour: hour,
      minute: minute,
      second: second,
    );
  } else {
    NotificationService().scheduleSalahNotification(
      id: id,
      title: title,
      body: body,
      hour: hour,
      minute: minute,
      second: second,
      androidSound: adhan,
      iosSound: adhan,
      channelId: adhan,
    );
  }
  if (kDebugMode) {
    print(id);
  }
}

void asrNotification(adhan) {
  PrayerTimes prayer = getMyCoordinate();
  int id = 4;
  String title = 'صلاة العصر';
  String body = DateFormat.jm().format(prayer.asr);
  var hour = prayer.asr.hour;
  var minute = prayer.asr.minute;
  var second = prayer.asr.second;
  if (adhan == 'default') {
    NotificationService().scheduleDailyNotification(
      id: id,
      title: title,
      body: body,
      hour: hour,
      minute: minute,
      second: second,
    );
  } else {
    NotificationService().scheduleSalahNotification(
      id: id,
      title: title,
      body: body,
      hour: hour,
      minute: minute,
      second: second,
      androidSound: adhan,
      iosSound: adhan,
      channelId: adhan,
    );
  }
  if (kDebugMode) {
    print(id);
  }
}

void maghribNotification(adhan) {
  PrayerTimes prayer = getMyCoordinate();
  int id = 5;
  String title = 'صلاة المغرب';
  String body = DateFormat.jm().format(prayer.maghrib);
  var hour = prayer.maghrib.hour;
  var minute = prayer.maghrib.minute;
  var second = prayer.maghrib.second;
  if (adhan == 'default') {
    NotificationService().scheduleDailyNotification(
      id: id,
      title: title,
      body: body,
      hour: hour,
      minute: minute,
      second: second,
    );
  } else {
    NotificationService().scheduleSalahNotification(
      id: id,
      title: title,
      body: body,
      hour: hour,
      minute: minute,
      second: second,
      androidSound: adhan,
      iosSound: adhan,
      channelId: adhan,
    );
  }
  if (kDebugMode) {
    print(id);
  }
}

void ishaNotification(adhan) {
  PrayerTimes prayer = getMyCoordinate();
  int id = 6;
  String title = 'صلاة العشاء';
  String body = DateFormat.jm().format(prayer.isha);
  var hour = prayer.isha.hour;
  var minute = prayer.isha.minute;
  var second = prayer.isha.second;
  if (adhan == 'default') {
    NotificationService().scheduleDailyNotification(
      id: id,
      title: title,
      body: body,
      hour: hour,
      minute: minute,
      second: second,
    );
  } else {
    NotificationService().scheduleSalahNotification(
      id: id,
      title: title,
      body: body,
      hour: hour,
      minute: minute,
      second: second,
      androidSound: adhan,
      iosSound: adhan,
      channelId: adhan,
    );
  }
  if (kDebugMode) {
    print(id);
  }
}
