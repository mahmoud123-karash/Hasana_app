import 'package:hive/hive.dart';
import 'package:quran_app/features/tasbih/data/data_sources/tasbih_local_data_source.dart';
import 'package:quran_app/features/tasbih/data/models/tasbih_model.dart';
import 'package:quran_app/features/tasbih/domain/repo/tasbih_repo.dart';

import '../../../../core/contants/hive_boxes_name.dart';

class TasbihRepoImpl extends TasbihRepo {
  final TasbihLocalDataSource tasbihLocalDataSource;

  TasbihRepoImpl(this.tasbihLocalDataSource);
  @override
  List<TasbihModel> getTasbihs() {
    List<TasbihModel> tasabihs = tasbihLocalDataSource.getTasbihs();
    return tasabihs;
  }

  @override
  void addNewTasih({required String name}) {
    TasbihModel model = TasbihModel(name, 0);
    var box = Hive.box<TasbihModel>(tasbihBox);
    box.add(model);
  }

  @override
  Future removeTasbih({required int index}) async {
    var box = Hive.box<TasbihModel>(tasbihBox);
    await box.deleteAt(index);
  }

  @override
  void updateCount({
    required TasbihModel tasbih,
    required int index,
  }) async {
    var box = Hive.box<TasbihModel>(tasbihBox);
    await box.putAt(index, tasbih);
  }

  @override
  void deleteAllTasabih() async {
    var box = Hive.box<TasbihModel>(tasbihBox);
    await box.clear();
  }
}
