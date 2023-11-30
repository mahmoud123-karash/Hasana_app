import 'package:quran_app/features/listen/domain/entites/reciter_entity.dart';

import 'translated_name.dart';

class ReciterModel extends ReciterEntity {
  int? reciterId;
  String? reciterName;
  String? styleRead;
  TranslatedName? translatedName;

  ReciterModel({
    this.reciterId,
    this.reciterName,
    this.styleRead,
    this.translatedName,
  }) : super(
          id: reciterId ?? 0,
          name: translatedName?.name ?? '',
          style: styleRead ?? '',
        );

  factory ReciterModel.fromJson(Map<String, dynamic> json) => ReciterModel(
        reciterId: json['id'],
        reciterName: json['reciter_name'] as String?,
        styleRead: json['style'],
        translatedName: json['translated_name'] == null
            ? null
            : TranslatedName.fromJson(
                json['translated_name'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': reciterId,
        'reciter_name': reciterName,
        'style': styleRead,
        'translated_name': translatedName?.toJson(),
      };
}
