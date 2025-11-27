
class ColorModel {
  final String id;
  final String productId;
  final String colorName;
  final String image;
  final String colorcode;
  ColorModel({
    required this.id,
    required this.productId,
    required this.colorName,
    required this.image,
    required this.colorcode,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      id: json["id"].toString(),
      productId: json["product_id"].toString(),
      colorName: json["color_name"],
      image: json["image"],
      colorcode: json["hex"] ,
    );
  }
}
