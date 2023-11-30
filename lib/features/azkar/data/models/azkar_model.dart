class AzkarModel {
  String? category;
  String? count;
  String? description;
  String? reference;
  String? content;

  AzkarModel({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.content,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) => AzkarModel(
        category: json['category'] ?? '',
        count: json['count'] as String?,
        description: json['description'] ?? '',
        reference: json['reference'] ?? '',
        content: json['content'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'count': count,
        'description': description,
        'reference': reference,
        'content': content,
      };
}
