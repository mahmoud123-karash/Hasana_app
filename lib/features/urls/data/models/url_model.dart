class UrlModel {
  String? name;
  String? url;
  String? image;

  UrlModel({this.name, this.url, this.image});

  factory UrlModel.fromJson(Map<String, dynamic> json) => UrlModel(
        name: json['name'] ?? '',
        url: json['url'] ?? '',
        image: json['image'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
        'image': image,
      };
}
