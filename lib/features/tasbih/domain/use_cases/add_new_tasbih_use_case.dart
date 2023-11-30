import 'package:quran_app/features/tasbih/data/models/tasbih_model.dart';
import 'package:quran_app/features/tasbih/domain/repo/tasbih_repo.dart';

abstract class UseCase<Type, param2> {
  List<Type> add({required param2 name});
}

class AddNewTasbihUseCase extends UseCase<TasbihModel, String> {
  final TasbihRepo tasbihRepo;

  AddNewTasbihUseCase(this.tasbihRepo);

  @override
  List<TasbihModel> add({required String name}) {
    tasbihRepo.addNewTasih(name: name);
    List<TasbihModel> tasabih = tasbihRepo.getTasbihs();
    return tasabih;
  }
}
