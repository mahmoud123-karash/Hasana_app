// ignore_for_file: depend_on_referenced_packages

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/services/services.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/core/shared/lists.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';
import 'package:quran_app/features/azkar/domain/repo/akar_details_repo.dart';
import 'package:quran_app/features/azkar/presentation/manager/swiper_cubit/swiper_cubit.dart';
import 'package:quran_app/features/azkar/presentation/manager/swiper_cubit/swiper_states.dart';
import 'package:quran_app/features/azkar/presentation/views/widgets/control_swiper_widget.dart';
import 'package:quran_app/features/azkar/presentation/views/widgets/day_and_count_widget.dart';
import 'package:quran_app/features/azkar/presentation/views/widgets/swiper_askar_widget.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

class AzkarDetailsScreen extends StatefulWidget {
  const AzkarDetailsScreen(
      {super.key, required this.index, required this.data});
  final int index;
  final Map data;

  @override
  State<AzkarDetailsScreen> createState() => _AzkarDetailsScreenState();
}

class _AzkarDetailsScreenState extends State<AzkarDetailsScreen> {
  List<AzkarModel> azkar = [];
  @override
  void initState() {
    cache_helper.saveData(key: 'index', value: 0);
    azkar = extarctAzkar(widget.data, widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwiperCubit(
        AzkarDetailsRepo(),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            azkarNames(context)[widget.index],
          ),
        ),
        body: BlocBuilder<SwiperCubit, SwiperStates>(
          builder: (context, state) {
            SwiperController swiperController =
                SwiperCubit.get(context).swiperController;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  DayAndCountWidget(
                    count: azkar.length,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SwiperAzkarWidget(
                    azkar: azkar,
                    swiperController: swiperController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ControlSwiperWidget(
                    shareTap: () {
                      int index = cache_helper.getData(
                            key: 'index',
                          ) ??
                          1;
                      SwiperCubit.get(context).shareAzkarText(
                        text: azkar[index].content!,
                        context: context,
                        title: azkarNames(context)[widget.index],
                      );
                    },
                    backwardSwiper: () {
                      int index = cache_helper.getData(key: 'index') ?? 0;
                      if (index + 1 != 1) {
                        SwiperCubit.get(context).decrementSwiper();
                      }
                    },
                    forwardSwiper: () {
                      int index = cache_helper.getData(key: 'index') ?? 0;
                      if (index + 1 == azkar.length) {
                        mysnackbar(
                          text: 'لقد انتهيت القراءة',
                          context: context,
                        );
                      } else {
                        SwiperCubit.get(context).incrementSwiper();
                      }
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
