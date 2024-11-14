import 'package:flutter/material.dart';
import 'cart_item.dart';  // Impor model CartItem

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItem(CartItem item) {
    _cartItems.add(item);
    notifyListeners();  // Memberi tahu semua widget yang mendengarkan perubahan ini
  }

  double get totalPrice {
    double total = 0;
    for (var item in _cartItems) {
      total += item.totalPrice;
    }
    return total;
  }
}
