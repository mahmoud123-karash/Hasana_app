import 'package:hive/hive.dart';
part 'tasbih_model.g.dart';

@HiveType(typeId: 1)
class TasbihModel {
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final int? count;

  TasbihModel(this.name, this.count);
}
