import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/salah/domain/repo/location_repo.dart';
import 'package:quran_app/features/salah/domain/use_cases/location_use_case.dart';
import 'package:quran_app/features/salah/presetation/manager/salah_cubit/salah_cubit.dart';
import 'package:quran_app/features/salah/presetation/manager/salah_cubit/salah_states.dart';
import 'package:quran_app/features/salah/presetation/views/widgets/salah_content_widget.dart';
import 'package:quran_app/features/salah/presetation/views/widgets/salah_error_widget.dart';
import 'package:quran_app/features/salah/presetation/views/widgets/salah_loading_widget.dart';
import '../../../../generated/l10n.dart';

class SalahScreen extends StatefulWidget {
  const SalahScreen({super.key});

  @override
  State<SalahScreen> createState() => _SalahScreenState();
}

class _SalahScreenState extends State<SalahScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SalahCubit(
        LocationUseCase(
          LocationRepo(),
        ),
      )..getMyPosition(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).Alsalash),
          centerTitle: true,
        ),
        body: BlocBuilder<SalahCubit, SalahStates>(
          builder: (context, state) {
            if (state is ErrorGetPositionState) {
              return SalahErrorWidget(
                message: state.message,
              );
            } else if (state is GetPrayerTimesState) {
              return SalahContentWidget(times: state.times);
            } else {
              return const SalahLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
