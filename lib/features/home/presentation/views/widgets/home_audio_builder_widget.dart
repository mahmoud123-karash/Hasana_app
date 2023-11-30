import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/features/listen/presentation/manager/player_cubit/player_cubit.dart';
import 'package:quran_app/features/listen/presentation/manager/player_cubit/player_states.dart';
import 'package:quran_app/features/listen/presentation/views/player_screen.dart';
import '../../../../../generated/l10n.dart';
import 'content_text_widget.dart';
import 'home_audio_widget.dart';

class HomeAudioBuilderWidget extends StatefulWidget {
  const HomeAudioBuilderWidget({super.key});

  @override
  State<HomeAudioBuilderWidget> createState() => _HomeAudioBuilderWidgetState();
}

class _HomeAudioBuilderWidgetState extends State<HomeAudioBuilderWidget> {
  int? index;
  int? id;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorTo(
            context,
            PlayerScreen(
              id: id!,
              index: index!,
              isHome: true,
            ));
      },
      child: BlocBuilder<PlayerCubit, PlayerStates>(
        builder: (context, state) {
          String sName = cache_helper.getData(key: 'sName') ?? '';
          String image = cache_helper.getData(key: 'rImage') ?? '';
          id = cache_helper.getData(key: 'rindex') ?? 50;
          index = cache_helper.getData(key: 'sindex') ?? 150;
          int cachedPoeition = cache_helper.getData(key: 'position') ?? 0;

          var cubit = PlayerCubit.get(context);
          return index != 150
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContentTextWidget(text: S.of(context).music),
                    const SizedBox(
                      height: 5,
                    ),
                    HomeAudioWidget(
                      playTap: () {
                        if (cubit.isPaly) {
                          cubit.stopAudio();
                        } else {
                          cubit.playAudio(
                            id: id!,
                            index: index!,
                            newposition: Duration(seconds: cachedPoeition),
                            context: context,
                          );
                        }
                      },
                      skipNextTap: () {
                        cubit.seekForward(
                          duration: const Duration(seconds: 10),
                          context: context,
                        );
                      },
                      skipPreviousTap: () {
                        cubit.seekBackward(
                          duration: const Duration(seconds: 10),
                          context: context,
                        );
                      },
                      isplay: cubit.isPaly,
                      image: image,
                      stext: sName,
                    ),
                  ],
                )
              : Container();
        },
      ),
    );
  }
}
