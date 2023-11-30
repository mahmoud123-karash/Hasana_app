import 'package:quran_app/features/tasbih/data/models/tasbih_model.dart';
import 'package:quran_app/features/tasbih/domain/repo/tasbih_repo.dart';
import 'package:quran_app/features/tasbih/domain/use_cases/update_tasbih_use_case.dart';

abstract class UseCase<Type> {
  List<Type> update();
}

class ZeroCountTasabihUseCase extends UseCase<TasbihModel> {
  final TasbihRepo tasbihRepo;
  final UpdateTasbihUseCase updateTasbihUseCase;

  ZeroCountTasabihUseCase(this.tasbihRepo, this.updateTasbihUseCase);
  @override
  List<TasbihModel> update() {
    List<TasbihModel> tasabih = tasbihRepo.getTasbihs();
    for (var i = 0; i < tasabih.length; i++) {
      updateTasbihUseCase.update(i, 0);
    }
    return tasbihRepo.getTasbihs();
  }
}
