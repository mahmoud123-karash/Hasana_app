import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/generated/l10n.dart';

import '../../../../../core/contants/constants.dart';

class AddTasbihDialogWidget extends StatelessWidget {
  const AddTasbihDialogWidget(
      {super.key, required this.controller, required this.ontap});
  final TextEditingController controller;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        S.of(context).name,
        style: TextStyle(
          fontSize: 20,
          color: !cache_helper.getData(key: 'isdark') ? blackColor : whiteColor,
        ),
      ),
      content: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: !cache_helper.getData(key: 'isdark')
                  ? blackColor!
                  : whiteColor!,
            ),
          ),
          focusedBorder: const OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            S.of(context).cancel,
          ),
        ),
        TextButton(
          onPressed: ontap,
          child: Text(
            S.of(context).diolog,
          ),
        )
      ],
    );
  }
}
