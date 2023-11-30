import 'dart:io';
import 'dart:math';
import 'package:adhan/adhan.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/core/shared/lists.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/l10n.dart';

void generateVerseOfDay() {
  Random random = Random();
  int randomS = random.nextInt(114) + 1;
  int randomA = random.nextInt(quran.getVerseCount(randomS)) + 1;
  saverandomA(randomA);
  saverandomS(randomS);
}

List<AzkarModel> extarctAzkar(data, int index) {
  List<AzkarModel> azkar = [];
  for (var e in data[names[index]]) {
    azkar.add(AzkarModel.fromJson(e));
  }
  return azkar;
}

String readStyle(String style) {
  if (style == 'Muallim') {
    return 'المصحف المعلم';
  } else if (style == 'Mujawwad') {
    return 'مجود';
  } else {
    return 'مرتل';
  }
}

String formatDuration({required String duration}) {
  List<String> parts = duration.split('.');
  String timeString = parts[0];
  return timeString;
}

Future<void> openUrl({required String url}) async {
  final Uri url0 = Uri.parse(url);
  await launchUrl(url0).then((value) {
    if (value) {
      if (kDebugMode) {
        print("opened");
      }
    } else {
      if (kDebugMode) {
        print('error');
      }
    }
  });
}

Future<void> openEmail() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'karashmahmoud@gmail.com ',
  );
  await launchUrl(emailLaunchUri).then((value) {
    if (value) {
      if (kDebugMode) {
        print("opened");
      }
    } else {
      if (kDebugMode) {
        print('error');
      }
    }
  });
}

Future<void> share({required String title, required String text}) async {
  await FlutterShare.share(
    title: title,
    text: text,
    linkUrl: appLink,
  );
}

Future<bool> handleLocationPermission(context) async {
  bool serviceEnabled;
  LocationPermission permission;

  bool isConnected = await InternetConnectionChecker().hasConnection;
  if (!isConnected) {
    mysnackbar(context: context, text: S.of(context).noInternet);
    return false;
  }

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    mysnackbar(context: context, text: S.of(context).noService);

    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      mysnackbar(context: context, text: S.of(context).noPermission);

      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    mysnackbar(context: context, text: S.of(context).noPermission);

    return false;
  }
  return true;
}

String nextSalah(PrayerTimes prayerTimes) {
  String prayer = prayerTimes.nextPrayer().name;
  if (prayer == 'fajr') {
    return 'الفجر';
  } else if (prayer == 'sunrise') {
    return 'شروق الشمس';
  } else if (prayer == 'dhuhr') {
    return 'الظهر';
  } else if (prayer == 'asr') {
    return 'العصر';
  } else if (prayer == 'maghrib') {
    return 'المغرب';
  } else if (prayer == 'isha') {
    return 'العشاء';
  } else {
    return '';
  }
}

Duration duration(PrayerTimes prayerTimes) {
  final sunnahTimes = SunnahTimes(prayerTimes);
  Duration sDuration =
      sunnahTimes.lastThirdOfTheNight.difference(DateTime.now());
  DateTime timeNextSalah = prayerTimes.timeForPrayer(
      prayerTimes.nextPrayer().index == 0
          ? Prayer.fajr
          : prayerTimes.nextPrayer())!;
  Duration duration = prayerTimes.nextPrayer().index == 0
      ? sDuration
      : timeNextSalah.difference(DateTime.now());

  return duration;
}

Future<bool?> requestNotificationPermissions() async {
  bool? isGranted;
  if (Platform.isIOS) {
    isGranted = await FlutterLocalNotificationsPlugin()
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    return isGranted;
  } else if (Platform.isAndroid) {
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        FlutterLocalNotificationsPlugin().resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    isGranted = await androidImplementation?.requestPermission();
    return isGranted;
  } else {
    return true;
  }
}

void copyToClipboard(context, text) {
  Clipboard.setData(ClipboardData(text: text));
  myToast(message: 'تم النسخ', gravity: ToastGravity.BOTTOM);
}

String convertToArabicNum(int number) {
  return ArabicNumbers().convert(number);
}
