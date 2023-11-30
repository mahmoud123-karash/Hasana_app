import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../../../../../core/services/notification_service.dart';
import 'switch_list_tile_widget.dart';

class AzkarMasahSwitchWidget extends StatefulWidget {
  const AzkarMasahSwitchWidget({super.key});

  @override
  State<AzkarMasahSwitchWidget> createState() => _AzkarMasahSwitchWidgetState();
}

class _AzkarMasahSwitchWidgetState extends State<AzkarMasahSwitchWidget> {
  late bool a2;

  @override
  void initState() {
    a2 = cache_helper.getData(key: 'a2') ?? true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTileWidget(
      value: a2,
      text: 'أذكار المساء',
      onChanged: (value) {
        saveA2(value);
        setState(() {
          a2 = value;
        });
        if (value) {
          NotificationService().scheduleDailyNotification(
            id: 1,
            title: 'أذكار المساء',
            body: 'موعد قراءة الأذكار',
            hour: 16,
            minute: 30,
            second: 0,
          );
        } else {
          NotificationService().cancelNotification(1);
        }
      },
    );
  }
}
