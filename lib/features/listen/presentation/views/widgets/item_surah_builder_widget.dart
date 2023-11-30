import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/item_surrah_widget.dart';
import 'package:quran_app/features/listen/presentation/manager/player_cubit/player_cubit.dart';
import 'package:quran_app/features/listen/presentation/manager/player_cubit/player_states.dart';

class ItemSurahBuilderWidget extends StatelessWidget {
  const ItemSurahBuilderWidget({
    super.key,
    required this.index,
    required this.image,
    required this.name,
    required this.id,
  });
  final int index;
  final String image;
  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerCubit, PlayerStates>(
      builder: (context, state) {
        bool isplay = cache_helper.getData(key: 'ispaly') ?? false;
        String cacheUrl = cache_helper.getData(key: 'url') ?? '';
        return ItemSurahWidget(
          index: index,
          image: image,
          name: name,
          cacheUrl: cacheUrl,
          isPlay: isplay,
          id: id,
        );
      },
    );
  }
}
