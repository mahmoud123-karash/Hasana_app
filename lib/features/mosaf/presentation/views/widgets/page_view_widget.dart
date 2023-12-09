import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/features/mosaf/presentation/manager/page_cubit/page_cubit.dart';
import 'package:quran_app/features/mosaf/presentation/manager/page_cubit/page_states.dart';
import 'package:quran_app/features/mosaf/presentation/manager/tafsser_cubit/tafsser_cubit.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/surah_item_widget.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key, required this.images});
  final List<String> images;

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  late int page;
  @override
  void initState() {
    page = cache_helper.getData(key: 'pagenumber') ?? 0;
    TafsserCubit.get(context).getTafsserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, PageStates>(
      builder: (context, state) {
        var cubit = PageCubit.get(context);
        return Padding(
          padding: const EdgeInsets.only(),
          child: Swiper(
            controller: cubit.swiperController,
            index: cubit.index == 1000 ? page - 1 : cubit.index,
            loop: false,
            onIndexChanged: (value) {
              cubit.savePage(value);
            },
            itemCount: 604,
            itemBuilder: (context, index) => SurahItemWidget(
              index: index,
              image: widget.images[index],
              count: widget.images.length,
            ),
          ),
        );
      },
    );
  }
}
