import 'package:flutter/material.dart';

import 'text_data_widget.dart';

class CompassDataWidget extends StatelessWidget {
  const CompassDataWidget(
      {super.key, required this.direction, required this.qiblah});
  final double direction;
  final double qiblah;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 20,
      ),
      child: Row(
        children: [
          TextDataWidget(
            text: 'الشمال الحقيقي',
            direction: direction,
          ),
          const Spacer(),
          TextDataWidget(
            text: 'الكعبة',
            direction: qiblah,
          )
        ],
      ),
    );
  }
}
