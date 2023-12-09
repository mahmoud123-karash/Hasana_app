import 'package:dio/dio.dart';

class DioHelper {
  final Dio dio;
  DioHelper(this.dio);

  String baseUri = 'https://api.quran.com/api/v4/';

  Future<Map<String, dynamic>> getData({required String endPount}) async {
    var reciters = await dio.get('$baseUri$endPount');
    return reciters.data;
  }

  Future download({
    required String uri,
    required String filePath,
    required Function(int, int) onReceiveProgress,
  }) async {
    await dio.download(
      uri,
      filePath,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future downloadImage({
    required String uri,
  }) async {
    var response = await dio.get(
      uri,
      options: Options(responseType: ResponseType.bytes),
    );

    return response;
  }
}
