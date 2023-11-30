import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/features/notification_settings/presentation/manager/adhan_cubit/adhan_cubit.dart';
import 'package:quran_app/features/notification_settings/presentation/views/widgets/secondry_switch_listtile_sound_widget.dart';

import 'radio_adan_text_widget.dart';

class RadioLitTileSoundWidget extends StatefulWidget {
  const RadioLitTileSoundWidget({
    super.key,
    required this.cubit,
    required this.text,
    required this.value,
  });
  final AdhanCubit cubit;
  final String text;
  final String value;

  @override
  State<RadioLitTileSoundWidget> createState() =>
      _RadioLitTileSoundWidgetState();
}

class _RadioLitTileSoundWidgetState extends State<RadioLitTileSoundWidget> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      secondary: SecondrySwitchListTileSoundWidget(
        text: widget.value,
        cubit: widget.cubit,
      ),
      title: RadioAdanTextWidget(text: widget.text),
      value: widget.value,
      groupValue: widget.cubit.groupValue,
      onChanged: (value) {
        if (widget.cubit.isPlay) {
          widget.cubit.stopAdhan('', true);
        }
        FlutterRingtonePlayer.playNotification();
        if (value == cache_helper.getData(key: 'adhan')) {
          widget.cubit.ischange = false;
        } else {
          widget.cubit.ischange = true;
        }
        setState(() {
          widget.cubit.groupValue = widget.value;
        });
      },
    );
  }
}
