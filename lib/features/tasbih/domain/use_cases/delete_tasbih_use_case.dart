import 'package:quran_app/features/tasbih/data/models/tasbih_model.dart';
import 'package:quran_app/features/tasbih/domain/repo/tasbih_repo.dart';

abstract class UseCase<Type, param> {
  List<Type> remove(param index);
}

class DeleteTasbihUseCase extends UseCase<TasbihModel, int> {
  final TasbihRepo tasbihRepo;

  DeleteTasbihUseCase(this.tasbihRepo);
  @override
  List<TasbihModel> remove(int index) {
    tasbihRepo.removeTasbih(index: index);
    List<TasbihModel> tasabih = tasbihRepo.getTasbihs();
    return tasabih;
  }
}
