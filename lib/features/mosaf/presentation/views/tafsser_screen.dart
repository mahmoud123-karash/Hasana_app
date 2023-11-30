import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/features/mosaf/presentation/manager/tafsser_cubit/tafsser_cubit.dart';
import 'package:quran_app/features/mosaf/presentation/manager/tafsser_cubit/tafsser_states.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/tafsser_swiper_widget.dart';

class TafsserScreen extends StatefulWidget {
  const TafsserScreen({super.key});

  @override
  State<TafsserScreen> createState() => _TafsserScreenState();
}

class _TafsserScreenState extends State<TafsserScreen> {
  late int page;
  @override
  void initState() {
    page = cache_helper.getData(key: 'pagenumber');
    TafsserCubit.get(context).getPageTafsserData(page: page);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "صفحة  ${page + 1}",
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      body: BlocBuilder<TafsserCubit, TafsserStates>(
        builder: (context, state) {
          var list = TafsserCubit.get(context).data;
          return list.isNotEmpty
              ? TafsserSwiperWidget(
                  list: list,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
