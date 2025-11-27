import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/ProductModel.dart';
import '../models/category_model.dart';
import '../models/product_color_model.dart';
import '../models/product_highlight_model.dart';
import '../models/product_image_model.dart';
import '../models/product_offer_model.dart';
import '../models/product_review_model.dart';
import '../models/product_size_model.dart';

class ProductApi {
  static const String url = "http://10.21.98.64:3000";

  static Future<List<ProductModel>?> fetchProducts()async{
      var response=await http.get(Uri.parse("$url/home-products"));
      if(response.statusCode==200){
        var resBody=response.body;
        List<dynamic> jsonBody=jsonDecode(resBody);
        var convertToModal=jsonBody.map((e) => ProductModel.fromJson(e),).toList();
        return convertToModal;
      }
      return null;
   }
  static Future<List<ProductModel>?> fetchProductScreenProducts() async {
    var response = await http.get(Uri.parse("$url/product-screen"));
    if (response.statusCode == 200) {
      List<dynamic> jsonBody = jsonDecode(response.body);
      return jsonBody.map((e) => ProductModel.fromJson(e)).toList();
    }
    return null;
  }

  static Future<List<CategoryModel>?> fetchCategories()async{
     var response=await http.get(Uri.parse("$url/categories"));
     if(response.statusCode==200){
       var resBody=response.body;
       List<dynamic> jsonBody=jsonDecode(resBody);
       var convertToModal=jsonBody.map((e) => CategoryModel.fromJson(e),).toList();
       return convertToModal;
     }
     return null;
   }

  static Future<List<ProductColorModel>> fetchColors(int id) async {
    var res = await http.get(Uri.parse("$url/product/$id/colors"));
    if (res.statusCode == 200) {
      List data = jsonDecode(res.body);
      return data.map((e) => ProductColorModel.fromJson(e)).toList();
    }
    return [];
  }

  static Future<List<ProductSizeModel>> fetchSizes(int id) async {
    var res = await http.get(Uri.parse("$url/product/$id/sizes"));
    if (res.statusCode == 200) {
      List data = jsonDecode(res.body);
      return data.map((e) => ProductSizeModel.fromJson(e)).toList();
    }
    return [];
  }

  static Future<List<ProductImageModel>> fetchImages(int id) async {
    var res = await http.get(Uri.parse("$url/product/$id/images"));
    if (res.statusCode == 200) {
      List data = jsonDecode(res.body);
      return data.map((e) => ProductImageModel.fromJson(e)).toList();
    }
    return [];
  }

  static Future<List<ProductOfferModel>> fetchOffers(int id) async {
    var res = await http.get(Uri.parse("$url/product/$id/offers"));
    if (res.statusCode == 200) {
      List data = jsonDecode(res.body);
      return data.map((e) => ProductOfferModel.fromJson(e)).toList();
    }
    return [];
  }

  static Future<List<ProductHighlightModel>> fetchHighlights(int id) async {
    var res = await http.get(Uri.parse("$url/product/$id/highlights"));
    if (res.statusCode == 200) {
      List data = jsonDecode(res.body);
      return data.map((e) => ProductHighlightModel.fromJson(e)).toList();
    }
    return [];
  }

  static Future<List<ProductReviewModel>> fetchReviews(int id) async {
    var res = await http.get(Uri.parse("$url/reviews/$id"));
    if (res.statusCode == 200) {
      List data = jsonDecode(res.body);
      return data.map((e) => ProductReviewModel.fromJson(e)).toList();
    }

    return [];
  }
  static Future<ProductModel?> fetchProduct(int id) async {
    var res = await http.get(Uri.parse("$url/product/$id"));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return ProductModel.fromJson(data);
    }
    return null;
  }
}
