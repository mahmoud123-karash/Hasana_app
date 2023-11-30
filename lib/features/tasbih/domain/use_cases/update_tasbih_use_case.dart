import 'package:quran_app/features/tasbih/data/models/tasbih_model.dart';
import 'package:quran_app/features/tasbih/domain/repo/tasbih_repo.dart';

abstract class UseCase<Type, param, param1> {
  List<Type> update(param index, param1 count);
}

class UpdateTasbihUseCase extends UseCase<TasbihModel, int, int> {
  final TasbihRepo tasbihRepo;

  UpdateTasbihUseCase(this.tasbihRepo);

  @override
  List<TasbihModel> update(int index, int count) {
    List<TasbihModel> tasabih = tasbihRepo.getTasbihs();
    String name = tasabih[index].name!;
    int newCount = count == 0 ? count : tasabih[index].count! + count;
    TasbihModel model = TasbihModel(name, newCount);

    tasbihRepo.updateCount(tasbih: model, index: index);
    return tasabih;
  }
}
