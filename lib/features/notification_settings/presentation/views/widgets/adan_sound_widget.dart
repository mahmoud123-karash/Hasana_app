import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/notification_settings/presentation/manager/adhan_cubit/adhan_cubit.dart';
import 'package:quran_app/features/notification_settings/presentation/manager/adhan_cubit/adhan_states.dart';
import 'package:quran_app/features/notification_settings/presentation/views/widgets/radio_listtile_sound_widget.dart';
import 'package:quran_app/features/notification_settings/presentation/views/widgets/secondry_switch_listtile_sound_widget.dart';
import 'radio_adan_text_widget.dart';
import 'text_name_noti_widget.dart';

class AdanSoundWidget extends StatefulWidget {
  const AdanSoundWidget({super.key});

  @override
  State<AdanSoundWidget> createState() => _AdanSoundWidgetState();
}

class _AdanSoundWidgetState extends State<AdanSoundWidget> {
  late AdhanCubit cubit;

  @override
  void initState() {
    AdhanCubit.get(context).groupValue =
        cache_helper.getData(key: 'adhan') ?? 'default';
    super.initState();
  }

  @override
  void didChangeDependencies() {
    cubit = AdhanCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    cubit.player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdhanCubit, AdhanStates>(
      builder: (context, state) {
        var cubit = AdhanCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextNameNotiWidget(text: 'الاذان'),
            RadioLitTileSoundWidget(
              cubit: cubit,
              text: 'الإشعار الإفتراضي',
              value: 'default',
            ),
            const SizedBox(
              height: 10,
            ),
            RadioListTile(
              secondary: SecondrySwitchListTileSoundWidget(
                text: 'adhan1',
                cubit: cubit,
              ),
              title: const RadioAdanTextWidget(text: 'الأذان 1'),
              value: 'adhan1',
              groupValue: cubit.groupValue,
              onChanged: (value) {
                if (value == cache_helper.getData(key: 'adhan')) {
                  cubit.ischange = false;
                } else {
                  cubit.ischange = true;
                }
                if (cubit.isPlay) {
                  cubit.stopAdhan(adhan1Path, false);
                } else {
                  cubit.playAdhan(adhan1Path);
                }
                setState(() {
                  cubit.groupValue = 'adhan1';
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            RadioListTile(
              secondary: SecondrySwitchListTileSoundWidget(
                text: 'adhan2',
                cubit: cubit,
              ),
              title: const RadioAdanTextWidget(text: 'الأذان 2'),
              value: 'adhan2',
              groupValue: cubit.groupValue,
              onChanged: (value) {
                if (value == cache_helper.getData(key: 'adhan')) {
                  cubit.ischange = false;
                } else {
                  cubit.ischange = true;
                }
                if (cubit.isPlay) {
                  cubit.stopAdhan(adhan2Path, false);
                } else {
                  cubit.playAdhan(adhan2Path);
                }
                setState(() {
                  cubit.groupValue = 'adhan2';
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            RadioListTile(
              secondary: SecondrySwitchListTileSoundWidget(
                text: 'adhan3',
                cubit: cubit,
              ),
              title: const RadioAdanTextWidget(text: 'الأذان 3'),
              value: 'adhan3',
              groupValue: cubit.groupValue,
              onChanged: (value) {
                if (value == cache_helper.getData(key: 'adhan')) {
                  cubit.ischange = false;
                } else {
                  cubit.ischange = true;
                }
                if (cubit.isPlay) {
                  cubit.stopAdhan(adhan3Path, false);
                } else {
                  cubit.playAdhan(adhan3Path);
                }
                setState(() {
                  cubit.groupValue = 'adhan3';
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        );
      },
    );
  }
}
