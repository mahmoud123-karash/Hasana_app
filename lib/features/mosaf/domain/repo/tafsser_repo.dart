import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_app/features/mosaf/data/models/tafsser_model.dart';

import '../../../../core/contants/constants.dart';

class TafsserRepo {
  Future<List<TafsserModel>> readTafsserjson() async {
    String value = await rootBundle.loadString(jsonTafsser);
    List<dynamic> list = json.decode(value);
    List<TafsserModel> tafsserList = [];
    for (var element in list) {
      tafsserList.add(TafsserModel.fromJson(element));
    }
    return tafsserList;
  }
}
