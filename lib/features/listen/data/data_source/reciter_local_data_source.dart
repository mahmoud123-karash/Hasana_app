import 'package:hive/hive.dart';
import 'package:quran_app/core/contants/hive_boxes_name.dart';
import 'package:quran_app/features/listen/domain/entites/reciter_entity.dart';

abstract class ReciterLocalDataSource {
  List<ReciterEntity> getReciterLocalData();
}

class ReciterLocalDataSourceImpl extends ReciterLocalDataSource {
  @override
  List<ReciterEntity> getReciterLocalData() {
    var box = Hive.box<ReciterEntity>(reciterBox);
    return box.values.toList();
  }
}
