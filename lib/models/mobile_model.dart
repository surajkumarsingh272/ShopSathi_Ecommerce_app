
import 'ProductModel.dart';
import 'color_model.dart';

class MobileMainModel {
  final ProductModel? product;
  final List<ColorModel> colors;
  final List<ProductModel> premiumPhones;

  MobileMainModel({
    required this.product,
    required this.colors,
    required this.premiumPhones,
  });

  factory MobileMainModel.fromJson(Map<String, dynamic> json) {
    return MobileMainModel(
      product: ProductModel.fromJson(json["product"]),
      colors: (json["colors"] as List).map((e) => ColorModel.fromJson(e)).toList(),
      premiumPhones: (json["premiumPhones"] as List).map((e) => ProductModel.fromJson(e)).toList(),
    );
  }
}
