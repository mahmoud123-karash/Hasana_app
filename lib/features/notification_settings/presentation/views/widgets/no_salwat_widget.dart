import 'package:flutter/material.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/features/salah/presetation/views/salah_screen.dart';

import '../../../../../core/contants/constants.dart';
import '../../../../../generated/l10n.dart';

class NoSalwatWidget extends StatelessWidget {
  const NoSalwatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).salwat,
          style: TextStyle(
            fontSize: 20,
            color: myColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            navigatorTo(context, const SalahScreen());
          },
          child: Container(
            decoration: BoxDecoration(
              color: myColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'متابعة',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
