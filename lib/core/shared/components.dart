import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

Route createRoute(Widget widget) {
  return PageRouteBuilder(
    transitionDuration: const Duration(
      milliseconds: 600,
    ),
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(2, 0);
      const end = Offset.zero;
      const curve = Curves.ease;
      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
