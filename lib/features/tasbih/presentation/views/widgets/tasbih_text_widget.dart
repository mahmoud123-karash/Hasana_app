import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/features/tasbih/presentation/views/new_tasbih_screen.dart';

import '../../../../../core/contants/constants.dart';

class TasbihTextWidget extends StatelessWidget {
  const TasbihTextWidget({super.key, required this.tasName});
  final String tasName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          navigatorTo(context, const NewTasbihScreen());
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: !cache_helper.getData(key: 'isdark')
                  ? blackColor!
                  : whiteColor!,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              tasName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: !cache_helper.getData(key: 'isdark')
                    ? blackColor
                    : whiteColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
