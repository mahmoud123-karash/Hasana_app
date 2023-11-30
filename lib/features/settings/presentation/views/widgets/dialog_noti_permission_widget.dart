import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/generated/l10n.dart';

import '../../../../../core/contants/constants.dart';

class DialogNotiPermissionWidget extends StatelessWidget {
  const DialogNotiPermissionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'تفعيل الإشعارات',
        style: TextStyle(
          fontSize: 20,
          color: cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            S.of(context).no,
          ),
        ),
        TextButton(
          onPressed: () {
            AppSettings.openAppSettings(
              type: AppSettingsType.notification,
            );
            Navigator.pop(context);
          },
          child: Text(
            S.of(context).settings,
          ),
        ),
      ],
    );
  }
}
