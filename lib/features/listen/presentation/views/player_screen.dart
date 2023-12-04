import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/services/services.dart';
import 'package:quran_app/features/listen/presentation/manager/player_cubit/player_cubit.dart';
import 'package:quran_app/features/listen/presentation/manager/player_cubit/player_states.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/duration_row_widget.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/image_widget.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/name_text_widget.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/paly_and_skip_widget.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/slider_widget.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({
    super.key,
    required this.isHome,
    required this.index,
    required this.id,
  });
  final bool isHome;
  final int index;
  final int id;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  String? image;
  String? rName;
  String? sName;
  @override
  void initState() {
    image = cache_helper.getData(key: 'rImage') ?? '';
    rName = cache_helper.getData(key: 'rName') ?? '';
    sName = cache_helper.getData(key: 'sName') ?? '';
    int cachedPosition = cache_helper.getData(key: 'position') ?? 0;
    int sIndex = cache_helper.getData(key: 'sindex') ?? 150;
    int sid = cache_helper.getData(key: 'rindex') ?? 50;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (PlayerCubit.get(context).isPaly) {
        if (sIndex != widget.index || sid != widget.id) {
          PlayerCubit.get(context).pauseAudio();
          PlayerCubit.get(context).playAudio(
            newposition: widget.isHome
                ? Duration(seconds: cachedPosition)
                : Duration.zero,
            context: context,
            id: widget.id,
            index: widget.index,
          );
        }
      } else {
        PlayerCubit.get(context).playAudio(
          newposition:
              widget.isHome ? Duration(seconds: cachedPosition) : Duration.zero,
          context: context,
          id: widget.id,
          index: widget.index,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerCubit, PlayerStates>(
      builder: (context, state) {
        var cubit = PlayerCubit.get(context);
        String min = formatDuration(duration: cubit.position.toString());
        String max = formatDuration(duration: cubit.duration.toString());
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(image: image!),
              const SizedBox(
                height: 40,
              ),
              NameTextWidget(name: sName!),
              NameTextWidget(name: rName!),
              const SizedBox(
                height: 15,
              ),
              SliderWidget(
                value: cubit.position.inSeconds.toDouble(),
                max: cubit.duration.inSeconds.toDouble(),
                onChange: (value) {
                  if (cubit.isPaly) {
                    cubit.playAudio(
                      newposition: Duration(seconds: value.toInt()),
                      context: context,
                      id: widget.id,
                      index: widget.index,
                    );
                  } else {
                    setState(() {});
                    cubit.position = Duration(seconds: value.toInt());
                  }
                },
              ),
              DurationRowWidget(
                minText: min,
                maxText: max,
              ),
              const SizedBox(
                height: 25,
              ),
              PalyAndSkipWidget(
                isplay: cubit.isPaly,
                playTap: () {
                  if (cubit.isPaly) {
                    cubit.stopAudio();
                  } else {
                    cubit.playAudio(
                      id: widget.id,
                      index: widget.index,
                      newposition: cubit.position,
                      context: context,
                    );
                  }
                },
                skipNextTap: () {
                  if (cubit.position < cubit.duration) {
                    cubit.seekForward(
                      duration: const Duration(seconds: 10),
                      context: context,
                    );
                  }
                },
                skipPreviousTap: () {
                  if (cubit.position > Duration.zero) {
                    cubit.seekBackward(
                      duration: const Duration(seconds: 10),
                      context: context,
                    );
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
