import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/home/presentation/manager/home_cubit.dart';
import 'package:quran_app/generated/l10n.dart';

class ShareAyatWidget extends StatelessWidget {
  const ShareAyatWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HomeCubit.get(context).shareAyahOfTheDay(text: text, context: context);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: myColor!,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).sharea,
              style: TextStyle(
                fontSize: 20,
                color: myColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.copy),
            ),
          ],
        ),
      ),
    );
  }
}
