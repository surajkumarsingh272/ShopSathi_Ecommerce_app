
import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../models/product_model.dart';
import '../../models/search_models/recent_search_model.dart';
import '../../services/product_api.dart';


class SearchProvider with ChangeNotifier {

  List<ProductModel> searchResults = [];
  List<RecentSearchModel> recentSearches = [];
  List<RecentSearchModel> popularSearches = [];


  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      searchResults = [];
      notifyListeners();
      return;
    }
    var data = await ProductApi.searchProducts(query);
    searchResults = data;
    notifyListeners();
  }

  void clearSearch() {
    searchResults = [];
    notifyListeners();
  }

  Future<void> saveRecentSearch(int userId, String keyword) async {
    await ProductApi.saveRecentSearch(userId, keyword);
    await getRecentSearches(userId);
  }

  Future<void> getRecentSearches(int userId) async {
    var data = await ProductApi.getRecentSearches(userId);
    recentSearches = data;
    notifyListeners();
  }

  Future<void> getPopularSearches() async {
    var data = await ProductApi.getPopularSearches();
    popularSearches = data;
    notifyListeners();
  }
}
