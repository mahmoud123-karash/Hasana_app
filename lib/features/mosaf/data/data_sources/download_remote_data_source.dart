import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_app/core/api/dio_helper.dart';

abstract class DownloadRemoteDataSource {
  Future<String> download({
    required String url,
    required String path,
  });
}

class DownloadRemoteDataSourceImpl extends DownloadRemoteDataSource {
  final DioHelper dioHelper;

  DownloadRemoteDataSourceImpl(this.dioHelper);
  @override
  Future<String> download({
    required String url,
    required String path,
  }) async {
    String filePath = "${(await getTemporaryDirectory()).path}/$path";
    if (!await File(filePath).exists()) {
      Response<dynamic> response = await dioHelper.downloadImage(
        uri: url,
      );
      File file = File(filePath);
      await file.writeAsBytes(response.data);
      return filePath;
    } else {
      return filePath;
    }
  }
}
