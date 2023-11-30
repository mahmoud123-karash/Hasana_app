class TafsserModel {
  int? id;
  int? sura;
  int? aya;
  String? text;

  TafsserModel({this.id, this.sura, this.aya, this.text});

  factory TafsserModel.fromJson(Map<String, dynamic> json) => TafsserModel(
        id: json['id'] ?? 0,
        sura: json['sura'] ?? 0,
        aya: json['aya'] ?? 0,
        text: json['text'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sura': sura,
        'aya': aya,
        'text': text,
      };
}
