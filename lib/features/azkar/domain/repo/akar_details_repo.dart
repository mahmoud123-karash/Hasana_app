import 'package:flutter_share/flutter_share.dart';

class AzkarDetailsRepo {
  Future<bool?> shareAzkarText({
    required String title,
    required String text,
    required String linkUrl,
  }) async {
    return await FlutterShare.share(
      title: title,
      text: text,
      linkUrl: linkUrl,
      chooserTitle: title,
    );
  }
}
