import 'package:hive/hive.dart';
part 'reciter_entity.g.dart';

@HiveType(typeId: 0)
class ReciterEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String style;

  ReciterEntity({required this.id, required this.name, required this.style});
}
