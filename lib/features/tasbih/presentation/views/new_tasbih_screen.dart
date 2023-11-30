import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/tasbih/presentation/manager/tasbih_cubit/tasbih_cubit.dart';
import 'package:quran_app/features/tasbih/presentation/manager/tasbih_cubit/tasbih_states.dart';
import 'package:quran_app/features/tasbih/presentation/views/widgets/empty_list_message_widget.dart';
import 'package:quran_app/features/tasbih/presentation/views/widgets/floating_action_button_widget.dart';
import 'package:quran_app/features/tasbih/presentation/views/widgets/list_view_tsabih_widget.dart';
import 'package:quran_app/features/tasbih/presentation/views/widgets/settings_dialog_widget.dart';
import 'package:quran_app/generated/l10n.dart';

class NewTasbihScreen extends StatefulWidget {
  const NewTasbihScreen({super.key});

  @override
  State<NewTasbihScreen> createState() => _NewTasbihScreenState();
}

class _NewTasbihScreenState extends State<NewTasbihScreen> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    TasbihCubit.get(context).getTasabih();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).ctasbih),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => SettingDiologWidget(
                  resetTap: () {
                    Navigator.pop(context);
                    TasbihCubit.get(context).makeCountsZero(context);
                  },
                  zeroTap: () {
                    Navigator.pop(context);
                    TasbihCubit.get(context).deleteAllTasabih(context);
                  },
                ),
              );
            },
            icon: const Icon(Icons.more_vert_sharp),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButtonWidget(controller: controller),
      body: BlocBuilder<TasbihCubit, TasbihStates>(
        builder: (context, state) {
          if (state is SuccessGetTasbihState) {
            if (state.tasabih.isEmpty) {
              return EmptyListMessageWidget(text: S.of(context).messageE);
            } else {
              return ListViewTasabihWidget(tasabih: state.tasabih);
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
