
import 'package:shop_sathi_app/models/product_model.dart';
import 'package:shop_sathi_app/models/product_phone_screen_modal.dart';

import 'color_model.dart';

class MobileMainModel {
  final ProductPhoneScreenModal? product;
  final List<ColorModel> colors;
  final List<ProductModel> premiumPhones;

  MobileMainModel({
    required this.product,
    required this.colors,
    required this.premiumPhones,
  });

  factory MobileMainModel.fromJson(Map<String, dynamic> json) {
    return MobileMainModel(
      product: ProductPhoneScreenModal.fromJson(json["product"]),
      colors: (json["colors"] as List).map((e) => ColorModel.fromJson(e)).toList(),
      premiumPhones: (json["premiumPhones"] as List).map((e) => ProductModel.fromJson(e)).toList(),
    );
  }
}
