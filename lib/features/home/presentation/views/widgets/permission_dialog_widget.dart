import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../core/contants/constants.dart';
import '../../../../../generated/l10n.dart';

class PermissionDialogWidget extends StatelessWidget {
  const PermissionDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        S.of(context).permission,
        style: TextStyle(
          color: myColor,
          fontSize: 20,
        ),
      ),
      content: Text(
        S.of(context).permM,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(S.of(context).no),
        ),
        TextButton(
          onPressed: () {
            Geolocator.openAppSettings();
          },
          child: Text(S.of(context).settings),
        ),
      ],
    );
  }
}
