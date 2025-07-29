// lib/providers/cart_provider.dart
import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<int, Product> _cartItems = {};

  Map<int, Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems[product.id] = product;
    notifyListeners();
  }

  void removeFromCart(int productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  bool isInCart(int productId) {
    return _cartItems.containsKey(productId);
  }

  double get totalPrice {
    return _cartItems.values
        .fold(0.0, (sum, item) => sum + item.price);
  }

  int get itemCount => _cartItems.length;
}
