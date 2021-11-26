import 'package:flutter/foundation.dart';

class CartItem {
  String id;
  String title;
  double price;
  int quantity;
  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (exItem) => CartItem(
              id: exItem.id,
              title: exItem.title,
              price: exItem.price + price,
              quantity: exItem.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              price: price,
              title: title,
              quantity: 1));
    }
    notifyListeners();
  }

  int itemCount() {
    notifyListeners();
    return _items.length;
  }
}
