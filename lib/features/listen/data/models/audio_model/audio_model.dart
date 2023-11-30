class AudioModel {
  num? id;
  num? chapterId;
  num? fileSize;
  String? format;
  String? audioUrl;

  AudioModel({
    this.id,
    this.chapterId,
    this.fileSize,
    this.format,
    this.audioUrl,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel(
        id: json['id'] ?? 0,
        chapterId: json['chapter_id'] ?? 0,
        fileSize: json['file_size'] ?? 0,
        format: json['format'] ?? '',
        audioUrl: json['audio_url'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'chapter_id': chapterId,
        'file_size': fileSize,
        'format': format,
        'audio_url': audioUrl,
      };
}
