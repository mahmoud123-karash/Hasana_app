import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';

import '../../../../../generated/l10n.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget(
      {super.key,
      required this.title,
      required this.body,
      required this.onpressed});
  final String title;
  final Widget body;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: myColor,
        ),
      ),
      content: body,
      actions: [
        TextButton(
          onPressed: onpressed,
          child: Text(
            S.of(context).diolog,
          ),
        )
      ],
    );
  }
}
