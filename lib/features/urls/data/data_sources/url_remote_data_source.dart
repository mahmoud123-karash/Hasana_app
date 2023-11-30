import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quran_app/features/urls/data/models/url_model.dart';

abstract class UrlRemoteDataSource {
  Future<List<UrlModel>> getUrls();
}

class UrlRemoteDataSourceImpl extends UrlRemoteDataSource {
  @override
  Future<List<UrlModel>> getUrls() async {
    var data =
        await FirebaseFirestore.instance.collection('urls_collection').get();
    List<UrlModel> urls = [];
    for (var e in data.docs) {
      urls.add(UrlModel.fromJson(e.data()));
    }
    return urls;
  }
}
