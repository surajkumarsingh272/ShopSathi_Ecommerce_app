import 'package:flutter/material.dart';
import '../models/banner_modal.dart';
import '../models/product_model.dart';
import '../services/category_api.dart';

class CategoryProvider with ChangeNotifier {
  List<Map<String, dynamic>> categories = [];
  List<BannerModel> banners = [];
  List<ProductModel> topProducts = [];
  List<ProductModel> newProducts = [];

  Future<void> loadCategories() async {
    categories = await CategoryApi.fetchCategories();
    notifyListeners();
  }

  Future<void> loadBanners() async {
    banners = await CategoryApi.fetchBanners();
    notifyListeners();
  }

  Future<void> loadTopProducts() async {
    topProducts = await CategoryApi.fetchTopProducts();
    notifyListeners();
  }

  Future<void> loadNewProducts() async {
    newProducts = await CategoryApi.fetchNewProducts();
    notifyListeners();
  }
}
