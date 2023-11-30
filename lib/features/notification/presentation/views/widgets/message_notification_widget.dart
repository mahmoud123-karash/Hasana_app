import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';

class MessageNotificationWidget extends StatelessWidget {
  const MessageNotificationWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: myColor,
        ),
      ),
    );
  }
}
