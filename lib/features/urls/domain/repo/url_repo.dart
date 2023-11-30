import 'package:quran_app/features/urls/data/models/url_model.dart';

abstract class UrlRepo {
  Future<List<UrlModel>> getUrls();
}
