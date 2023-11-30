import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/icon_download_audio_widget.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/paly_and_pause_icon_widget.dart';
import '../../manager/audio_cubit/audio_cubit.dart';
import '../../manager/audio_cubit/audio_states.dart';
import 'progress_download_widget.dart';

class ProgressDownloadBuilderWidget extends StatelessWidget {
  const ProgressDownloadBuilderWidget(
      {super.key, required this.index, required this.isPlay, required this.id});
  final int index;
  final int id;
  final bool isPlay;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioStates>(
      builder: (context, state) {
        var cubit = AudioCubit.get(context);
        int cindex = cache_helper.getData(key: 'sindex') ?? 0;
        int cid = cache_helper.getData(key: 'rindex') ?? 0;
        if (cubit.isExits[index]) {
          if (cindex == index && cid == id) {
            return isPlay
                ? const PlayAndPauseIconWidget(
                    icon: Icons.pause,
                  )
                : const PlayAndPauseIconWidget(
                    icon: Icons.play_arrow,
                  );
          } else {
            return const PlayAndPauseIconWidget(
              icon: Icons.play_arrow,
            );
          }
        } else {
          if (AudioCubit.get(context).index == index) {
            if (state is LoadingDownloadAudioState) {
              return ProgressDownloadWidget(
                progress: AudioCubit.get(context).progress,
              );
            } else if (state is SuccessDownloadAudioState) {
              if (cindex == index) {
                return isPlay
                    ? const PlayAndPauseIconWidget(
                        icon: Icons.pause,
                      )
                    : const PlayAndPauseIconWidget(
                        icon: Icons.play_arrow,
                      );
              }
              return const PlayAndPauseIconWidget(
                icon: Icons.play_arrow,
              );
            } else {
              return const IconDownloadAudioWidget();
            }
          } else {
            return const IconDownloadAudioWidget();
          }
        }
      },
    );
  }
}
