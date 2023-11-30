import 'package:quran_app/core/api/dio_helper.dart';
import 'package:quran_app/core/api/end_points.dart';
import 'package:quran_app/features/listen/data/models/audio_model/audio_model.dart';

abstract class AudioRemoteDataSource {
  Future<List<AudioModel>> getRemoteAudioFiles({required int id});
}

class AudioRemoteDataSourceImpl extends AudioRemoteDataSource {
  final DioHelper dioHelper;

  AudioRemoteDataSourceImpl(this.dioHelper);

  @override
  Future<List<AudioModel>> getRemoteAudioFiles({required int id}) async {
    Map<String, dynamic> data =
        await dioHelper.getData(endPount: EndPoints.audioEndPoint(id));
    List<AudioModel> audiofiles = parseData(data);
    return audiofiles;
  }

  List<AudioModel> parseData(Map<String, dynamic> data) {
    List<AudioModel> audiofiles = [];
    for (var e in data['audio_files']) {
      audiofiles.add(AudioModel.fromJson(e));
    }
    return audiofiles;
  }
}
