import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/shared/components.dart';

import '../../../../notification_settings/presentation/views/notification_settings_screen.dart';

class SalahNotificationIconWidget extends StatefulWidget {
  const SalahNotificationIconWidget({super.key});

  @override
  State<SalahNotificationIconWidget> createState() =>
      _SalahNotificationIconWidgetState();
}

class _SalahNotificationIconWidgetState
    extends State<SalahNotificationIconWidget> {
  late double cachedLatitude;
  @override
  void initState() {
    cachedLatitude = cache_helper.getData(key: 'latitude') ?? 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return cachedLatitude == 0.0
        ? Container()
        : IconButton(
            onPressed: () {
              navigatorTo(
                context,
                const NotificationSettingsScreen(sal: true, azk: false),
              );
            },
            icon: const Icon(
              Icons.notifications_none_outlined,
            ),
          );
  }
}
