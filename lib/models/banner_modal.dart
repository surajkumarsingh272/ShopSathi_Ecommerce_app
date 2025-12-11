class BannerModel {
  int? id;
  String? title;
  String? image;
  String? redirectUrl;
  String? type;

  BannerModel({this.id, this.title, this.image, this.redirectUrl, this.type});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      redirectUrl: json['redirect_url'],
      type: json['type'],
    );
  }
}