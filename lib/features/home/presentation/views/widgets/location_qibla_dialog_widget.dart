import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../../../../../core/contants/constants.dart';

class LocationQiblaDialogWidget extends StatelessWidget {
  const LocationQiblaDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        'تفعيل الموقع',
        style: TextStyle(
          color: cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
          fontSize: 20,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            AppSettings.openAppSettings(
              type: AppSettingsType.location,
            );
            Navigator.pop(context);
          },
          child: Text(
            'الاعدادات',
            style: TextStyle(
              color: myColor,
              fontSize: 15,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'إلغاء',
            style: TextStyle(
              color: myColor,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
