import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/listen/presentation/manager/reciter_cubit/reciter_cubit.dart';
import 'package:quran_app/features/listen/presentation/manager/reciter_cubit/reciter_states.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/loading_widget.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/reciter_grid_view_widget.dart';

class ReciterGridViewBuilderWidget extends StatelessWidget {
  const ReciterGridViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReciterCubit, ReciterStates>(
      builder: (context, state) {
        if (state is SuccessGetReciterDataState) {
          return ReciterGridViewWidget(
            reciters: state.reciters,
          );
        } else if (state is ErrorGetReciterDataState) {
          return Center(
            child: Text(
              state.error.toString(),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
