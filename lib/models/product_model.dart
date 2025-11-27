class ProductModel {
  String? name;
  String? image;
  double? rating;
  double? oldPrice;
  double? newPrice;
  int? discount;

  ProductModel({
    this.name,
    this.image,
    this.rating,
    this.oldPrice,
    this.newPrice,
    this.discount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      image: json['image'],
      rating: double.tryParse(json['rating'].toString()) ?? 0.0,
      oldPrice: double.tryParse(json['old_price'].toString()) ?? 0.0,
      newPrice: double.tryParse(json['new_price'].toString()) ?? 0.0,
      discount: int.tryParse(json['discount'].toString()) ?? 0,
    );
  }
}
