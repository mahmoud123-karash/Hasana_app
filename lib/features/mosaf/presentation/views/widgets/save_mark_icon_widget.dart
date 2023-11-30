import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/features/mosaf/presentation/manager/page_cubit/page_cubit.dart';

import '../../../../../core/contants/constants.dart';
import '../../manager/page_cubit/page_states.dart';

class SaveMarkItemWidget extends StatelessWidget {
  const SaveMarkItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, PageStates>(
      builder: (context, state) {
        int page = cache_helper.getData(key: 'pagenumber') ?? 1;
        int mark = cache_helper.getData(key: 'saveMark') ?? 0;
        return IconButton(
          onPressed: () {
            PageCubit.get(context).savePageMark(context);
          },
          icon: mark == page
              ? const Icon(
                  Icons.bookmark,
                  color: Colors.amber,
                )
              : Icon(
                  Icons.bookmark_border_rounded,
                  color: cache_helper.getData(key: 'isdark')
                      ? whiteColor
                      : blackColor,
                ),
        );
      },
    );
  }
}
