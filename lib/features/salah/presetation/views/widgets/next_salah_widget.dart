import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/shared/assets.dart';
import 'package:quran_app/features/salah/presetation/manager/salah_cubit/salah_cubit.dart';
import 'package:quran_app/features/salah/presetation/manager/salah_cubit/salah_states.dart';
import 'next_salah_data_widget.dart';

class NextSalahWidget extends StatefulWidget {
  const NextSalahWidget({super.key, required this.times});
  final List<String> times;

  @override
  State<NextSalahWidget> createState() => _NextSalahWidgetState();
}

class _NextSalahWidgetState extends State<NextSalahWidget> {
  @override
  void initState() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      if (mounted) {
        SalahCubit.get(context).getSalahTimes();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: BlocBuilder<SalahCubit, SalahStates>(
        builder: (context, state) => Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                Assets.imagesSt,
              ),
              colorFilter: ColorFilter.mode(
                Colors.greenAccent,
                BlendMode.multiply,
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: NextSalahDataWidget(
              times: widget.times,
            ),
          ),
        ),
      ),
    );
  }
}
