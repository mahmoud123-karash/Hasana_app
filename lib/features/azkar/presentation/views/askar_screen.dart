import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/azkar/data/data_source/azkar_remote_data_source.dart';
import 'package:quran_app/features/azkar/data/repo/azkar_repo_impl.dart';
import 'package:quran_app/features/azkar/presentation/manager/azkar_cubit/azkar_cubit.dart';
import 'package:quran_app/features/azkar/presentation/manager/azkar_cubit/azkar_states.dart';
import 'package:quran_app/features/azkar/presentation/views/widgets/azkar_grid_view_widget.dart';
import 'package:quran_app/features/azkar/presentation/views/widgets/azkar_loading_widget.dart';
import 'package:quran_app/generated/l10n.dart';

import 'widgets/azkar_notification_icon_widget.dart';

class AskarScreen extends StatelessWidget {
  const AskarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarCubit(
        AzkarRepoImpl(
          AzkarRemoteDataSourceImpl(),
        ),
      )..readAzkarFromJson(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).azkar,
          ),
          actions: const [
            AzkarNotificationIconWidget(),
          ],
        ),
        body: BlocBuilder<AzkarCubit, AzkarStates>(
          builder: (context, state) {
            if (state is SuccessReadAzkarState) {
              return AzkarGridViewWidget(
                azkar: state.azkar,
              );
            } else {
              return const AzkarLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
