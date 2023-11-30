// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/core/contants/constants.dart';

ThemeData lightmode = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: myColor!),
  primaryColor: myColor,
  useMaterial3: true,
  listTileTheme: ListTileThemeData(
    iconColor: blackColor,
    textColor: blackColor,
  ),
  iconTheme: IconThemeData(color: myColor),
  drawerTheme: DrawerThemeData(backgroundColor: Colors.white, elevation: 0.0),
  primarySwatch: Colors.green,
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: blackColor),
    bodyLarge: TextStyle(
      color: blackColor,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: blackColor),
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(color: myColor, fontSize: 25),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    elevation: 0,
    actionsIconTheme: IconThemeData(
      color: blackColor,
      size: 30,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: blackColor,
    unselectedItemColor: gColor,
    backgroundColor: myColor,
    elevation: 0,
  ),
);

ThemeData darkmode = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: myColor!),
  primaryColor: myColor,
  useMaterial3: true,
  dialogBackgroundColor: darkbackground,
  listTileTheme: ListTileThemeData(
    iconColor: blackColor,
    textColor: blackColor,
  ),
  iconTheme: IconThemeData(color: myColor),
  drawerTheme: DrawerThemeData(
    backgroundColor: darkbackground,
  ),
  primarySwatch: Colors.green,
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: blackColor),
    bodyLarge: TextStyle(color: blackColor),
  ),
  scaffoldBackgroundColor: darkbackground,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: myColor),
    backgroundColor: darkbackground,
    titleTextStyle: TextStyle(color: myColor, fontSize: 25),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: darkbackground,
      statusBarIconBrightness: Brightness.light,
    ),
    elevation: 0,
    actionsIconTheme: IconThemeData(color: myColor, size: 30),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: blackColor,
    unselectedItemColor: gColor,
    backgroundColor: myColor,
    elevation: 0,
  ),
);

Color darkbackground = Color(0xFF003B36);
