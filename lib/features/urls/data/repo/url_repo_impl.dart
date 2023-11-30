import 'package:quran_app/features/urls/data/data_sources/url_remote_data_source.dart';
import 'package:quran_app/features/urls/data/models/url_model.dart';
import 'package:quran_app/features/urls/domain/repo/url_repo.dart';

class UrlRepoImpl extends UrlRepo {
  final UrlRemoteDataSource urlRemoteDataSource;

  UrlRepoImpl(this.urlRemoteDataSource);
  @override
  Future<List<UrlModel>> getUrls() async {
    List<UrlModel> urls = await urlRemoteDataSource.getUrls();
    return urls;
  }
}
