import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class DioHelper {
  final Dio dio;
  DioHelper(this.dio);

  String baseUri = 'https://api.quran.com/api/v4/';

  Future<Map<String, dynamic>> getData({required String endPount}) async {
    var reciters = await dio.get('$baseUri$endPount');
    return reciters.data;
  }

  Future<String> downloadAudio({
    required String uri,
    required String path,
    required Function(int, int) onReceiveProgress,
  }) async {
    String filePath = (await getTemporaryDirectory()).path + path;
    await dio.download(
      uri,
      filePath,
      onReceiveProgress: onReceiveProgress,
    );
    return filePath;
  }
}
