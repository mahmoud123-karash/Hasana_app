import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/services/get_it.dart';
import 'package:quran_app/features/listen/data/repo/reciter_repo_impl.dart';
import 'package:quran_app/features/listen/presentation/manager/reciter_cubit/reciter_cubit.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/reciter_grid_view_builder_widget.dart';
import 'package:quran_app/generated/l10n.dart';

class ReciterScreen extends StatelessWidget {
  const ReciterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ReciterCubit(getIt.get<ReciterRepoImpl>())..getReciterData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).reciter),
          centerTitle: true,
        ),
        body: const ReciterGridViewBuilderWidget(),
      ),
    );
  }
}
