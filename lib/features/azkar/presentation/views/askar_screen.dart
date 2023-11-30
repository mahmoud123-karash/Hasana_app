import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/utils.dart';
import 'package:quran_app/features/azkar/data/data_source/azkar_remote_data_source.dart';
import 'package:quran_app/features/azkar/data/repo/azkar_repo_impl.dart';
import 'package:quran_app/features/azkar/presentation/manager/azkar_cubit/azkar_cubit.dart';
import 'package:quran_app/features/azkar/presentation/manager/azkar_cubit/azkar_states.dart';
import 'package:quran_app/features/azkar/presentation/views/widgets/azkar_list_view_widget.dart';
import 'package:quran_app/features/azkar/presentation/views/widgets/azkar_loading_widget.dart';
import 'package:quran_app/generated/l10n.dart';

class AskarScreen extends StatefulWidget {
  const AskarScreen({super.key});

  @override
  State<AskarScreen> createState() => _AskarScreenState();
}

class _AskarScreenState extends State<AskarScreen> {
  @override
  void initState() {
    setAzkarNotification();
    super.initState();
  }

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
          centerTitle: true,
        ),
        body: BlocBuilder<AzkarCubit, AzkarStates>(
          builder: (context, state) {
            if (state is SuccessReadAzkarState) {
              return AzkarListViewWIdget(azkar: state.azkar);
            } else {
              return const AzkarLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
