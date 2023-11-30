import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import '../../../../../core/cache/save_data.dart';
import '../../../../../core/services/notification_service.dart';
import '../../../../../core/shared/lists.dart';
import '../../../../../core/utils/salwat_notifications.dart';
import 'switch_list_tile_widget.dart';
import 'text_name_noti_widget.dart';

class SlawatSwitchWidget extends StatefulWidget {
  const SlawatSwitchWidget({super.key});

  @override
  State<SlawatSwitchWidget> createState() => _SlawatSwitchWidgetState();
}

class _SlawatSwitchWidgetState extends State<SlawatSwitchWidget> {
  late bool s1;
  late bool s2;
  late bool s3;
  late bool s4;
  late bool s5;

  @override
  void initState() {
    s1 = cache_helper.getData(key: 's1') ?? true;
    s2 = cache_helper.getData(key: 's2') ?? true;
    s3 = cache_helper.getData(key: 's3') ?? true;
    s4 = cache_helper.getData(key: 's4') ?? true;
    s5 = cache_helper.getData(key: 's5') ?? true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextNameNotiWidget(text: 'الصلوات'),
        SwitchListTileWidget(
          value: s1,
          text: salatNames(context)[0],
          onChanged: (value) {
            saveS1(value);
            setState(() {
              s1 = value;
            });
            if (value) {
              String adhan = cache_helper.getData(key: 'adhan') ?? 'default';
              fajrNotification(adhan);
            } else {
              NotificationService().cancelNotification(2);
            }
          },
        ),
        SwitchListTileWidget(
          value: s2,
          text: salatNames(context)[2],
          onChanged: (value) {
            saveS2(value);
            setState(() {
              s2 = value;
            });
            if (value) {
              String adhan = cache_helper.getData(key: 'adhan') ?? 'default';
              dhuhrNotification(adhan);
            } else {
              NotificationService().cancelNotification(3);
            }
          },
        ),
        SwitchListTileWidget(
          value: s3,
          text: salatNames(context)[3],
          onChanged: (value) {
            saveS3(value);
            setState(() {
              s3 = value;
            });
            if (value) {
              String adhan = cache_helper.getData(key: 'adhan') ?? 'default';
              asrNotification(adhan);
            } else {
              NotificationService().cancelNotification(4);
            }
          },
        ),
        SwitchListTileWidget(
          value: s4,
          text: salatNames(context)[4],
          onChanged: (value) {
            saveS4(value);
            setState(() {
              s4 = value;
            });
            if (value) {
              String adhan = cache_helper.getData(key: 'adhan') ?? 'default';
              maghribNotification(adhan);
            } else {
              NotificationService().cancelNotification(5);
            }
          },
        ),
        SwitchListTileWidget(
          value: s5,
          text: salatNames(context)[5],
          onChanged: (value) {
            saveS5(value);
            setState(() {
              s5 = value;
            });
            if (value) {
              String adhan = cache_helper.getData(key: 'adhan') ?? 'default';
              ishaNotification(adhan);
            } else {
              NotificationService().cancelNotification(6);
            }
          },
        ),
      ],
    );
  }
}
