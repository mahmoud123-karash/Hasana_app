import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/tasbih/presentation/views/widgets/add_tasbih_dilog_widget.dart';

import '../../../../../core/shared/components.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/tasbih_cubit/tasbih_cubit.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => FloatingActionButton(
        tooltip: S.of(context).addtasbih,
        backgroundColor: myColor,
        onPressed: () {
          final tasbihCubit = BlocProvider.of<TasbihCubit>(context);
          controller.clear();
          showDialog(
            context: context,
            builder: (context) => AddTasbihDialogWidget(
              controller: controller,
              ontap: () {
                if (controller.text != '') {
                  tasbihCubit.addNewtasbih(
                    name: controller.text,
                    context: context,
                  );
                } else {
                  mysnackbar(context: context, text: S.of(context).message);
                }
              },
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
