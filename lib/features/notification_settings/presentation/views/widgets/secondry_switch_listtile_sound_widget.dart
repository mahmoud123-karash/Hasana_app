import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/core/utils/utils.dart';
import 'package:quran_app/features/notification_settings/presentation/manager/adhan_cubit/adhan_cubit.dart';

import 'botton_pause_widget.dart';

class SecondrySwitchListTileSoundWidget extends StatelessWidget {
  const SecondrySwitchListTileSoundWidget(
      {super.key, required this.text, required this.cubit});
  final String text;
  final AdhanCubit cubit;

  @override
  Widget build(BuildContext context) {
    String adhan = cache_helper.getData(key: 'adhan') ?? 'default';

    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          text == cubit.groupValue && cubit.isPlay
              ? const ButtonPauseWidget()
              : Container(
                  width: 5,
                ),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            hoverColor: myColor,
            onTap: () {
              if (adhan == text) {
                mysnackbar(context: context, text: 'مطبق بالفعل');
              } else {
                AdhanCubit.get(context).groupValue = text;
                saveAdhan(text);
                AdhanCubit.get(context).stopAdhan('path', true);
                AdhanCubit.get(context).ischange = false;
                setSalwatNotifications();
                mysnackbar(context: context, text: 'تم التطبيق');
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: myColor!,
                ),
                color: adhan == text
                    ? myColor
                    : Colors.white.withOpacity(
                        0.1,
                      ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  adhan == text ? 'مطبق' : 'تطبيق',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: adhan == text
                        ? whiteColor
                        : cache_helper.getData(key: 'isdark')
                            ? whiteColor!
                            : blackColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
