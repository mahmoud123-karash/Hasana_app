// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

class DayAndCountWidget extends StatelessWidget {
  const DayAndCountWidget({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          DateFormat('EEEE').format(
            DateTime.now(),
          ),
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w700, color: myColor),
        ),
        const Spacer(),
        Text(
          '${cache_helper.getData(key: 'index') + 1 ?? 0}/$count',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w700, color: myColor),
        )
      ],
    );
  }
}
