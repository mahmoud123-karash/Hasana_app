class TranslatedName {
  String? name;
  String? languageName;

  TranslatedName({required this.name, this.languageName});

  factory TranslatedName.fromJson(Map<String, dynamic> json) {
    return TranslatedName(
      name: json['name'] ?? '',
      languageName: json['language_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'language_name': languageName,
      };
}
