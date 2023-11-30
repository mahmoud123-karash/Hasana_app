import 'package:flutter/services.dart';
import 'package:quran_app/core/contants/constants.dart';

abstract class AzkarRemoteDataSource {
  Future<String> readAzkarFromJson();
}

class AzkarRemoteDataSourceImpl extends AzkarRemoteDataSource {
  @override
  Future<String> readAzkarFromJson() async {
    String value = await rootBundle.loadString(jsonAzkar);
    return value;
  }
}
