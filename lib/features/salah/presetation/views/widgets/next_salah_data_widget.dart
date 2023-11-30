import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import '../../../../../generated/l10n.dart';
import 'next_salah_text_widget.dart';
import 'time_and_salah_widget.dart';

class NextSalahDataWidget extends StatelessWidget {
  const NextSalahDataWidget({super.key, required this.times});
  final List<String> times;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NextSalahTextWidget(
          text: S.of(context).nextsal,
          icon: FlutterIslamicIcons.solidPrayingPerson,
        ),
        TimeAndSalahWidget(
          text: times[7] == '' ? 'القيام' : times[7],
        ),
        const SizedBox(
          height: 20,
        ),
        NextSalahTextWidget(
          text: S.of(context).timeS,
          icon: Icons.timelapse_sharp,
        ),
        times[9] == '0' && times[10] == '0'
            ? const TimeAndSalahWidget(text: 'الآن')
            : Row(
                children: [
                  if (times[9] != '0')
                    TimeAndSalahWidget(
                      text: '${times[9]} ساعة و',
                    ),
                  const SizedBox(
                    width: 5,
                  ),
                  if (times[10] != '0')
                    TimeAndSalahWidget(
                      text: '${times[10]} دقيقة',
                    )
                ],
              )
      ],
    );
  }
}
