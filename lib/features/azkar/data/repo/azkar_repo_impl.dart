import 'package:quran_app/features/azkar/data/data_source/azkar_remote_data_source.dart';
import 'package:quran_app/features/azkar/domain/repo/azkar_repo.dart';

class AzkarRepoImpl extends AzkarRepo {
  final AzkarRemoteDataSource azkarRemoteDataSource;

  AzkarRepoImpl(this.azkarRemoteDataSource);

  @override
  Future<String> readAzkarFromJson() {
    return azkarRemoteDataSource.readAzkarFromJson();
  }
}
