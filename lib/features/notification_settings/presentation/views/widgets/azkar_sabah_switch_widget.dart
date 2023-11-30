import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../../../../../core/services/notification_service.dart';
import 'switch_list_tile_widget.dart';

class AzkarSabahSwitchWidget extends StatefulWidget {
  const AzkarSabahSwitchWidget({super.key});

  @override
  State<AzkarSabahSwitchWidget> createState() => _AzkarSabahSwitchWidgetState();
}

class _AzkarSabahSwitchWidgetState extends State<AzkarSabahSwitchWidget> {
  late bool a1;

  @override
  void initState() {
    a1 = cache_helper.getData(key: 'a1') ?? true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTileWidget(
      value: a1,
      text: 'أذكار الصباح',
      onChanged: (value) {
        saveA1(value);
        setState(() {
          a1 = value;
        });
        if (value) {
          NotificationService().scheduleDailyNotification(
            id: 0,
            title: 'أذكار الصباح',
            body: 'موعد قراءة الأذكار',
            hour: 7,
            minute: 0,
            second: 0,
          );
        } else {
          NotificationService().cancelNotification(0);
        }
      },
    );
  }
}
