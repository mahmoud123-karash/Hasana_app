import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/notification_settings/presentation/manager/adhan_cubit/adhan_states.dart';

class AdhanCubit extends Cubit<AdhanStates> {
  AdhanCubit() : super(InitialAdanState());
  static AdhanCubit get(context) => BlocProvider.of(context);

  AudioPlayer player = AudioPlayer();
  bool isPlay = false;
  late String groupValue;
  bool ischange = false;

  void playAdhan(path) async {
    ByteData bytes = await rootBundle.load(path);
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    player.play(BytesSource(soundbytes)).then((value) {
      isPlay = true;
      emit(SuccessPlayState());
    });
  }

  void stopAdhan(path, ischange) {
    if (ischange) {
      player.stop().then((value) {
        isPlay = false;
        emit(SuccessStopState());
      });
    } else {
      player.stop().then((value) {
        isPlay = false;
        playAdhan(path);
      });
    }
  }
}
