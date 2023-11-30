import 'package:hive/hive.dart';
import 'package:quran_app/core/contants/hive_boxes_name.dart';
import 'package:quran_app/features/tasbih/data/models/tasbih_model.dart';

abstract class TasbihLocalDataSource {
  List<TasbihModel> getTasbihs();
}

class TasbihLocalDataSourceImpl extends TasbihLocalDataSource {
  @override
  List<TasbihModel> getTasbihs() {
    var box = Hive.box<TasbihModel>(tasbihBox);
    return box.values.toList();
  }
}
