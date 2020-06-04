import 'package:flutter/material.dart';
import 'package:spark_demo/models/cartItem.dart';

class Cart with ChangeNotifier {
  Map<String, CartItemModel> _items = {};
  Map<String, CartItemModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }
  double get totalAmount {
    var total =0.0;
    _items.forEach((key, cartItem) { 
      total += cartItem.price* cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      //..change quantity
      _items.update(
        productId,
        (existingCardItem) => CartItemModel(
          id: existingCardItem.id,
          title: existingCardItem.title,
          price: existingCardItem.price,
          quantity: existingCardItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItemModel(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }
  // void removeItem (String productId){
  //   _items.remove(productId);
  //   notifyListeners();
     
  // }
}
