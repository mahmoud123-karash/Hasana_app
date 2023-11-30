import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/settings/presentation/manager/theme_cubit.dart';
import 'package:quran_app/features/settings/presentation/manager/theme_states.dart';

import '../../../../../core/contants/constants.dart';

class ThemeItemWidget extends StatelessWidget {
  const ThemeItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(builder: (context, state) {
      bool isDark = ThemeCubit.get(context).isDark;
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 5,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: secondColor,
            border: Border.all(
              color: gColor!,
              width: 0.2,
            ),
          ),
          child: SwitchListTile(
            secondary: Icon(
              isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
            title: const Text(
              'الوضع الليلي',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            value: isDark,
            onChanged: (value) {
              ThemeCubit.get(context).changeAppTheme();
            },
          ),
        ),
      );
    });
  }
}
