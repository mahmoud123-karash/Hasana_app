import 'package:quran_app/features/tasbih/data/models/tasbih_model.dart';

abstract class TasbihRepo {
  List<TasbihModel> getTasbihs();
  void addNewTasih({required String name});
  Future removeTasbih({required int index});
  void updateCount({required TasbihModel tasbih, required int index});
  void deleteAllTasabih();
}
