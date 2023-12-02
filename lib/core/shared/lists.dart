import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:quran_app/core/shared/assets.dart';
import 'package:quran_app/core/shared/azkar.dart';
import 'package:quran_app/features/home/presentation/views/home_screen.dart';
import 'package:quran_app/features/listen/presentation/views/reciter_screen.dart';
import 'package:quran_app/features/mosaf/presentation/views/mosaf_screen.dart';
import 'package:quran_app/features/qibla/presentation/views/qibla_screen.dart';
import 'package:quran_app/features/salah/presetation/views/salah_screen.dart';
import 'package:quran_app/features/salah/presetation/views/widgets/icon_salah_widget.dart';
import 'package:quran_app/features/tasbih/presentation/views/tasbih_screen.dart';
import 'package:quran_app/features/urls/presentation/views/uris_screen.dart';
import 'package:quran_app/generated/l10n.dart';
import 'package:quran_app/features/azkar/presentation/views/askar_screen.dart';
import '../../features/settings/presentation/views/settings_screen.dart';

List<Widget> screens = [
  const HomeScreen(),
  const MosafScreen(),
  const AskarScreen(),
  const SettingScreen()
];

List<String> contentImages = [
  Assets.imagesS,
  Assets.imagesListen,
  Assets.imagesTas,
  Assets.imagesQibla,
  Assets.imagesUrl,
];
List<String> contentTexts(context) => [
      S.of(context).Alsalash,
      S.of(context).listen,
      S.of(context).tasbih,
      S.of(context).qibla,
      S.of(context).url
    ];

List<Widget> contentScreens = [
  const SalahScreen(),
  const ReciterScreen(),
  const TasbihScreen(),
  const QiblaScreen(),
  const UrisScreen()
];

List<String> azkarNames(context) => [
      S.of(context).azkarS,
      S.of(context).azkarm,
      S.of(context).azkarsl,
      S.of(context).azkart,
      S.of(context).azkarn,
      S.of(context).azkare,
      S.of(context).adayak,
      S.of(context).adayaa,
      S.of(context).azkarw,
      'دعاء دخول الخلاء',
      'دعاء الخروج من الخلاء',
      'ذكر الخروج من المنزل',
      'ذكر الدخول للمنزل',
      'أذكار الآذان',
      'دعاء الاستفتاح',
      'الدعاء بعد التشهد',
      'فضل التسبيح',
    ];

List<String> azkatIamges = [
  Azkar.azkar1,
  Azkar.azkar2,
  Azkar.azkar3,
  Azkar.azkar4,
  Azkar.azkar5,
  Azkar.azkar6,
  Azkar.azkar7,
  Azkar.azkar8,
  Azkar.azkar9,
  Azkar.azkar10,
  Azkar.azkar11,
  Azkar.azkar12,
  Azkar.azkar13,
  Azkar.azkar14,
  Azkar.azkar15,
  Azkar.azkar16,
  Azkar.azkar17,
];

List<String> names = [
  "أذكار الصباح",
  "أذكار المساء",
  "أذكار بعدالصلاة",
  "تسابيح",
  "أذكار النوم",
  "أذكار الاستيقاظ",
  "أدعية قرآنية",
  "أدعية الأنبياء",
  "أذكارالوضوء",
  'دعاء دخول الخلاء',
  'دعاء الخروج من الخلاء',
  'ذكر الخروج من المنزل',
  'ذكر الدخول للمنزل',
  'أذكار الآذان',
  'دعاء الاستفتاح',
  'الدعاء بعد التشهد',
  'فضل التسبيح والتكبير',
];

List<String> juzNames = [
  'الجزء الأول',
  'الجزء الثاني',
  'الجزء الثالث',
  'الجزء الرابع',
  'الجزء الخامس',
  'الجزء السادس',
  'الجزء السابع',
  'الجزء الثامن',
  'الجزء التاسع',
  'الجزء العاشر',
  'الجزء الحادي عشر',
  'الجزء الثاني عشر',
  'الجزء الثالث عشر',
  'الجزء الرابع عشر',
  'الجزء الخامس عشر',
  'الجزء السادس عشر',
  'الجزء السابع عشر',
  'الجزء الثامن عشر',
  'الجزء التاسع عشر',
  'الجزء العشرون',
  'الجزء الحادي والعشرون',
  'الجزء الثاني والعشرون',
  'الجزء الثالث والعشرون',
  'الجزء الرابع والعشرون',
  'الجزء الخامس والعشرون',
  'الجزء السادس والعشرون',
  'الجزء السابع والعشرون',
  'الجزء الثامن والعشرون',
  'الجزء التاسع والعشرون',
  'الجزء الثلاثون',
];

List<String> recitersImage = [
  Assets.images1,
  Assets.images1,
  Assets.images2,
  Assets.images3,
  Assets.images4,
  Assets.images5,
  Assets.images6,
  Assets.images7,
  Assets.images7,
  Assets.images8,
  Assets.images9,
  Assets.images5
];

List<String> salatNames(context) => [
      S.of(context).fajr,
      S.of(context).shurooq,
      S.of(context).dhuhr,
      S.of(context).asr,
      S.of(context).maghrib,
      S.of(context).isha,
      'القيام'
    ];

List<Widget> salahIcons = [
  const IconSalahWidget(
    icon: Icons.nightlight_outlined,
  ),
  const IconSalahWidget(
    icon: FluentIcons.weather_sunny_high_24_regular,
  ),
  const IconSalahWidget(
    icon: Icons.wb_sunny_outlined,
  ),
  const IconSalahWidget(
    icon: FluentIcons.weather_sunny_32_regular,
  ),
  const IconSalahWidget(
    icon: FluentIcons.weather_sunny_low_24_regular,
  ),
  SizedBox(
    height: 20,
    width: 20,
    child: Image.asset(
      Assets.imagesCrescentMoon,
    ),
  ),
  const IconSalahWidget(
    icon: FlutterIslamicIcons.prayingPerson,
  ),
];
