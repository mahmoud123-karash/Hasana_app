import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/item_widget.dart';
import 'package:quran_app/generated/l10n.dart';

class HeaderDrawerWidget extends StatelessWidget {
  const HeaderDrawerWidget(
      {super.key,
      required this.ontapS,
      required this.ontapJ,
      required this.index});
  final VoidCallback ontapS;
  final VoidCallback ontapJ;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        children: [
          ItemWidget(
            ontap: ontapS,
            text: S.of(context).suras,
            color: index == 1 ? whiteColor! : myColor!,
            tColor: index == 1 ? gColor! : whiteColor!,
          ),
          const SizedBox(
            width: 10,
          ),
          ItemWidget(
            ontap: ontapJ,
            text: S.of(context).juz,
            color: index == 0 ? whiteColor! : myColor!,
            tColor: index == 0 ? gColor! : whiteColor!,
          ),
        ],
      ),
    );
  }
}
