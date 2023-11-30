import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/navbar/presentation/manager/navbar_cubit/navbar_cubit.dart';
import 'package:quran_app/generated/l10n.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            NavBarCubit.get(context).navigateBar(value);
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: myColor,
              icon: const Icon(FluentIcons.home_16_regular),
              label: S.of(context).home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(FlutterIslamicIcons.quran2),
              label: S.of(context).quran,
            ),
            BottomNavigationBarItem(
              icon: const Icon(FlutterIslamicIcons.prayer),
              label: S.of(context).azkar,
            ),
            BottomNavigationBarItem(
              icon: const Icon(FluentIcons.settings_20_regular),
              label: S.of(context).settings,
            )
          ],
        ),
      ),
    );
  }
}
