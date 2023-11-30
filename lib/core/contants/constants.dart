// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:quran_app/core/services/services.dart';

Size size(context) => MediaQuery.of(context).size;

Color? myColor = const Color(0xFF2FBF71);
Color? blackColor = Colors.black;
Color? whiteColor = Colors.white;
Color? gColor = Colors.black45;
Color? secondColor = const Color(0xFFE6EBE0);
Color? thirdColor = const Color(0xFFE4F0D0);

String textfamilyAus1 = 'noorehira';
String textfamilyAus2 = 'KFGQPC';
String textfamily = 'diodrum';

var dayname = JHijri.now().dayName;
var day = JHijri.now().day;
var monthName = JHijri.now().monthName;
var year = JHijri.now().year;

String jHijriDate =
    '$dayname ${convertToArabicNum(day)} $monthName ${convertToArabicNum(year)}';
String dateTime = DateFormat.yMMMd().format(DateTime.now());

String appLink =
    'https://play.google.com/store/apps/details?id=com.example.quran_app';

String jsonAzkar = 'assets/json/adkar.json';
String jsonTafsser = 'assets/json/ar_muyassar.json';

String appPrivacy =
    'https://www.freeprivacypolicy.com/live/a1e62b1a-513c-436b-aa66-cff524887a38';

var pageBuket = PageStorageBucket();

List<BoxShadow> boxShadow = [
  const BoxShadow(
    color: Colors.grey,
    offset: Offset(
      1.0,
      1.0,
    ),
    blurRadius: 5.0,
    spreadRadius: 1.0,
  ),
  const BoxShadow(
    color: Colors.white,
    offset: Offset(0.0, 0.0),
    blurRadius: 0.0,
    spreadRadius: 0.0,
  ),
];

String adhan1Path = 'assets/sound/adhan1.mp3';
String adhan2Path = 'assets/sound/adhan2.mp3';
String adhan3Path = 'assets/sound/adhan3.mp3';
