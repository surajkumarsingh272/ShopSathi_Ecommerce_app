import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../models/category_model.dart';
import '../services/product_api.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> products = [];
  List<CategoryModel> categories = [];
  List<ProductModel> productScreenProducts = [];


  Future<void> loadProducts() async {
    var data = await ProductApi.fetchProducts();
    if (data != null) {
      products.clear();
      products.addAll(data);
      notifyListeners();
    }
  }
  Future<void> loadProductScreenProducts() async {
    var data = await ProductApi.fetchProductScreenProducts();
    if (data != null) {
      productScreenProducts.clear();
      productScreenProducts.addAll(data);
      notifyListeners();
    }
  }
  Future<void> loadCategories() async {
    var data = await ProductApi.fetchCategories();
    if (data != null) {
      categories.clear();
      categories.addAll(data);
      notifyListeners();
    }
  }
}
