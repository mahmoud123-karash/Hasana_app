import 'package:flutter/material.dart';
import 'package:quran_app/features/tasbih/presentation/views/widgets/button_tasbih_widget.dart';
import 'package:quran_app/generated/l10n.dart';

class ResetCounterWidget extends StatelessWidget {
  const ResetCounterWidget({super.key, required this.resetTap});

  final VoidCallback resetTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ButtonTasbihWidget(
        text: S.of(context).reset,
        ontap: resetTap,
      ),
    );
  }
}
