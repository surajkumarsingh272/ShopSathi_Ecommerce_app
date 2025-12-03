import 'package:flutter/cupertino.dart';
import '../models/product_color_model.dart';
import '../models/product_highlight_model.dart';
import '../models/product_image_model.dart';
import '../models/product_model.dart';
import '../models/product_offer_model.dart';
import '../models/product_size_model.dart';
import '../services/product_api.dart';


class ProductDetailsProvider with ChangeNotifier {
  ProductModel? product;
  List<ProductColorModel> colors = [];
  List<ProductSizeModel> sizes = [];
  List<ProductImageModel> images = [];
  List<ProductOfferModel> offers = [];
  List<ProductHighlightModel> highlights = [];



  Future<void> loadAllProductData(int id) async {
    product = await ProductApi.fetchProduct(id);
    colors = await ProductApi.fetchColors(id);
    sizes = await ProductApi.fetchSizes(id);
    images = await ProductApi.fetchImages(id);
    offers = await ProductApi.fetchOffers(id);
    highlights = await ProductApi.fetchHighlights(id);
    notifyListeners();
  }

}

class ImageModel {
  final String imageUrl;

  ImageModel({required this.imageUrl});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      imageUrl: json['imageUrl'] ?? '',
    );
  }}
