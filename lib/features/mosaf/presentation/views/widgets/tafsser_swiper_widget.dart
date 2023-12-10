import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/mosaf/presentation/manager/tafsser_swiper_cubit/tafsser_swiper_cubit.dart';
import 'package:quran_app/features/mosaf/presentation/manager/tafsser_swiper_cubit/tafsser_swiper_states.dart';
import '../../../domain/entities/page_data_entity.dart';
import 'tafseer_item_widget.dart';

class TafsserSwiperWidget extends StatelessWidget {
  const TafsserSwiperWidget({super.key, required this.list});
  final List<PageDataEntity> list;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TafsserSwiperCubit(),
      child: BlocBuilder<TafsserSwiperCubit, TafsserSwiperStates>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Swiper(
            loop: false,
            onIndexChanged: (value) {},
            controller: TafsserSwiperCubit.get(context).swiperController,
            itemCount: list.length,
            itemBuilder: (context, index) => TAfsserItemWidget(
              data: list[index],
              firstVerse: list.first.aya!,
              lastVerse: list.last.aya!,
            ),
          ),
        ),
      ),
    );
  }
}
