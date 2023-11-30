import 'package:flutter/material.dart';

import '../../../../../core/contants/constants.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$jHijriDate / $dateTime",
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
