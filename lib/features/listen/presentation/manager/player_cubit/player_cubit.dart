import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/features/listen/presentation/manager/player_cubit/player_states.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quran_app/generated/l10n.dart';

class PlayerCubit extends Cubit<PlayerStates> {
  PlayerCubit() : super(InitialPlayerState());
  static PlayerCubit get(context) => BlocProvider.of(context, listen: false);

  final player = AudioPlayer();
  bool isPaly = false;
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  String noInternetM(context) => S.of(context).internet;

  void playAudio({
    required int index,
    required int id,
    required Duration newposition,
    required BuildContext context,
  }) {
    emit(LoadingPlayState());
    saveSIndex(index);
    saveRId(id);
    getTemporaryDirectory().then((value) {
      player
          .play(DeviceFileSource('${value.path}$index $id'),
              position: newposition)
          .then((value) {
        isPaly = true;
        isplay(true);
        player.onPlayerComplete.listen((event) {
          position = Duration.zero;
          stopAudio();
        });
        player.onPositionChanged.listen((event) async {
          player.getCurrentPosition().then((value) {
            position = value ?? Duration.zero;
            cachePosition(value != null ? value.inSeconds : 0);
          });
          emit(SuccessGetPositionState());
        });
        player.getDuration().then((value) {
          duration = value ?? Duration.zero;
          emit(SuccessPlayState());
        });
      }).catchError((error) {
        emit(ErrorPlayState());
      });
    });
  }

  void stopAudio() {
    emit(LoadingStopState());
    player.pause().then((value) {
      isPaly = false;
      isplay(false);
      player.dispose();
      emit(SuccessStopState());
    }).catchError((error) {
      emit(ErrorStopState());
    });
  }

  void seekForward({
    required Duration duration,
    required BuildContext context,
  }) {
    emit(LoadingSeekForwardState());

    Duration newPosition = position + duration;
    player.seek(newPosition).then((value) {
      emit(SuccessSeekForwardState());
    }).catchError((error) {
      emit(ErrorSeekForwardState());
    });
  }

  void seekBackward({
    required Duration duration,
    required BuildContext context,
  }) {
    emit(LoadingSeekBackwardState());

    Duration newPosition = position - duration;

    player.seek(newPosition).then((value) {
      emit(SuccessSeekBackwardState());
    }).catchError((error) {
      emit(ErrorSeekBackwardState());
    });
  }
}
