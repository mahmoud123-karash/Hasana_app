class NotificationModel {
  final String text;

  NotificationModel({required this.text});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        text: json['text'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'text': text,
      };
}
