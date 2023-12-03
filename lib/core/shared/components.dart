import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quran_app/core/services/navidation_route.dart';

void navigatorTo(context, widget) =>
    Navigator.of(context).push(createRoute(widget));

void navigatorToAndfinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: ((context) => widget)),
      (route) => false,
    );

Future<bool?> myToast(
        {required String message, required ToastGravity gravity}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: myColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );

void mysnackbar({required BuildContext context, required String text}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
