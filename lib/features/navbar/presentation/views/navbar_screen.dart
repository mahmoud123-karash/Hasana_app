// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/shared/lists.dart';
import 'package:quran_app/features/navbar/presentation/manager/navbar_cubit/navbar_cubit.dart';
import 'package:quran_app/features/navbar/presentation/manager/navbar_cubit/navbar_states.dart';
import 'package:quran_app/features/navbar/presentation/views/widgets/bottom_nav_bar_widget.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarStates>(
        builder: (context, state) {
          int index = NavBarCubit.get(context).initiaIndex;
          return WillPopScope(
            onWillPop: () async {
              if (index != 0) {
                NavBarCubit.get(context).navigateBar(0);
                return false;
              }
              return true;
            },
            child: Scaffold(
              bottomNavigationBar: BottomNavBarWidget(index: index),
              body: screens[index],
            ),
          );
        },
      ),
    );
  }
}
