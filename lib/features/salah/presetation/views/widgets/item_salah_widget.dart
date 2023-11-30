import 'package:flutter/material.dart';
import '../../../../../core/contants/constants.dart';
import 'text_salah_widget.dart';

class ItemSalahWidget extends StatelessWidget {
  const ItemSalahWidget(
      {super.key,
      required this.icon,
      required this.textName,
      required this.textTime,
      required this.index,
      required this.cIndex});
  final Widget icon;
  final String textName;
  final String textTime;
  final int index;
  final int cIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: index + 1 == cIndex ? myColor : secondColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 7,
            ),
            TextSalahsWidget(text: textName),
            const Spacer(),
            TextSalahsWidget(text: textTime),
          ],
        ),
      ),
    );
  }
}
