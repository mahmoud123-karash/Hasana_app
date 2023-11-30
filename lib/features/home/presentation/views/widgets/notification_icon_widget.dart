import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';

class NotificationIconWidget extends StatelessWidget {
  const NotificationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.notifications_active_outlined,
      size: 25,
      color: cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
    );
  }
}
