import 'package:flutter_share/flutter_share.dart';

class HomeRepo {
  Future<bool?> shareAyahOfTheDay({
    required String title,
    required String text,
    required String linkUrl,
  }) async {
    return await FlutterShare.share(
        title: title, text: text, linkUrl: linkUrl, chooserTitle: '');
  }
}
