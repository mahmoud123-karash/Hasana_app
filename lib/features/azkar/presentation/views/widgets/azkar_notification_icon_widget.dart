import 'package:flutter/material.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/features/notification_settings/presentation/views/notification_settings_screen.dart';

class AzkarNotificationIconWidget extends StatelessWidget {
  const AzkarNotificationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        navigatorTo(
            context, const NotificationSettingsScreen(sal: false, azk: true));
      },
      icon: const Icon(
        Icons.notifications_none_outlined,
      ),
    );
  }
}
