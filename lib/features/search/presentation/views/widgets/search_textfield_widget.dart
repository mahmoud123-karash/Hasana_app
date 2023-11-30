import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/features/search/presentation/manager/search_cubit.dart';
import 'package:quran_app/generated/l10n.dart';

import '../../../../../core/contants/constants.dart';
import '../../../../../core/services/normilze_text_service.dart';

class SearchTextFiledWidget extends StatefulWidget {
  const SearchTextFiledWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<SearchTextFiledWidget> createState() => _SearchTextFiledWidgetState();
}

class _SearchTextFiledWidgetState extends State<SearchTextFiledWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: !cache_helper.getData(key: 'isdark')
              ? Colors.grey[200]
              : Colors.black26,
        ),
        child: TextFormField(
          onChanged: (value) {
            setState(() {});
          },
          onFieldSubmitted: (value) {
            SearchCubit.get(context).search(searchValue: normalise(value));
          },
          keyboardType: TextInputType.text,
          style: TextStyle(
            color:
                cache_helper.getData(key: 'isdark') ? Colors.white54 : gColor,
          ),
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: S.of(context).search,
            hintStyle: TextStyle(
              color:
                  cache_helper.getData(key: 'isdark') ? Colors.white54 : gColor,
            ),
            suffixIcon: Icon(
              FluentIcons.search_12_regular,
              color: myColor,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
