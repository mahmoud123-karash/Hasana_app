import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/shared/components.dart';

import '../../../../notification_settings/presentation/views/notification_settings_screen.dart';

class SalahNotificationIconWidget extends StatelessWidget {
  const SalahNotificationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        double cachedLatitude = cache_helper.getData(key: 'latitude') ?? 0.0;
        if (cachedLatitude != 0.0) {
          navigatorTo(
            context,
            const NotificationSettingsScreen(sal: true, azk: false),
          );
        } else {
          mysnackbar(context: context, text: 'حدث خطأ');
        }
      },
      icon: const Icon(
        Icons.notifications_none_outlined,
      ),
    );
  }
}
