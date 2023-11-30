import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/features/search/presentation/views/search_screen.dart';

class SearchIconWIdget extends StatelessWidget {
  const SearchIconWIdget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        navigatorTo(context, const SearchScreen());
      },
      icon: Icon(
        FluentIcons.search_16_filled,
        color: cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
      ),
    );
  }
}
