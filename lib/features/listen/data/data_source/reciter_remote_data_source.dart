import 'package:hive/hive.dart';
import 'package:quran_app/core/api/dio_helper.dart';
import 'package:quran_app/core/api/end_points.dart';
import 'package:quran_app/core/contants/hive_boxes_name.dart';
import 'package:quran_app/features/listen/data/models/reciter_model/reciter_model.dart';
import 'package:quran_app/features/listen/domain/entites/reciter_entity.dart';

abstract class ReciterRemoteDataSource {
  Future<List<ReciterEntity>> getReciterData();
}

class ReciterRemoteDataSourceImpl extends ReciterRemoteDataSource {
  final DioHelper dioHelper;

  ReciterRemoteDataSourceImpl(this.dioHelper);
  @override
  Future<List<ReciterEntity>> getReciterData() async {
    var response = await dioHelper.getData(endPount: EndPoints.reciterEndPoint);
    List<ReciterEntity> reciters = parseData(response);
    saveRecitersLocal(sortElementsById(reciters));

    return sortElementsById(reciters);
  }

  void saveRecitersLocal(List<ReciterEntity> reciters) {
    var box = Hive.box<ReciterEntity>(reciterBox);
    box.addAll(reciters);
  }

  List<ReciterEntity> parseData(Map<String, dynamic> response) {
    List<ReciterEntity> reciters = [];
    for (var e in response['recitations']) {
      reciters.add(ReciterModel.fromJson(e));
    }
    return reciters;
  }

  List<ReciterEntity> sortElementsById(List<ReciterEntity> list) {
    List<ReciterEntity> sortedList = List.from(list);
    sortedList.sort((a, b) => a.id.compareTo(b.id));
    return sortedList;
  }
}
