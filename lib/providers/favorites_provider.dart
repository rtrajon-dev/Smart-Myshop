// lib/providers/favorites_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider with ChangeNotifier {
  final Set<int> _favoriteProductIds = {};

  Set<int> get favoriteProductIds => _favoriteProductIds;

  FavoritesProvider() {
    _loadFavorites();
  }

  void toggleFavorite(int productId) {
    if (_favoriteProductIds.contains(productId)) {
      _favoriteProductIds.remove(productId);
    } else {
      _favoriteProductIds.add(productId);
    }
    _saveFavorites();
    notifyListeners();
  }

  bool isFavorite(int productId) {
    return _favoriteProductIds.contains(productId);
  }

  void _saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'favoriteProductIds',
      _favoriteProductIds.map((id) => id.toString()).toList(),
    );
  }

  void _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? storedList = prefs.getStringList('favoriteProductIds');
    if (storedList != null) {
      _favoriteProductIds.addAll(storedList.map(int.parse));
      notifyListeners();
    }
  }
}




// // lib/providers/favorites_provider.dart
// import 'package:flutter/material.dart';
//
// class FavoritesProvider with ChangeNotifier {
//   final Set<int> _favoriteProductIds = {};
//
//   Set<int> get favoriteProductIds => _favoriteProductIds;
//
//   void toggleFavorite(int productId) {
//     if (_favoriteProductIds.contains(productId)) {
//       _favoriteProductIds.remove(productId);
//     } else {
//       _favoriteProductIds.add(productId);
//     }
//     notifyListeners();
//   }
//
//   bool isFavorite(int productId) {
//     return _favoriteProductIds.contains(productId);
//   }
// }
