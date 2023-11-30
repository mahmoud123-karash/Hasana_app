import 'package:flutter/material.dart';
import 'package:quran_app/core/services/services.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/copy_text_widget.dart';

import '../../../../../core/contants/constants.dart';

class CopyTextRowWidget extends StatelessWidget {
  const CopyTextRowWidget({
    super.key,
    required this.verseText,
    required this.tafsserText,
  });
  final String verseText;
  final String tafsserText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CopyTextWidget(
          text: 'نسخ التفسير',
          ontap: () {
            copyToClipboard(context, tafsserText);
          },
          cColor: myColor!,
          tColor: whiteColor!,
        ),
        const Spacer(),
        CopyTextWidget(
          text: 'نسخ الآية',
          ontap: () {
            copyToClipboard(context, verseText);
          },
          cColor: whiteColor!,
          tColor: blackColor!,
        )
      ],
    );
  }
}
