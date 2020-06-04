import 'package:flutter/material.dart';

import '../models/cartItem.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cart;
  CartItem({this.cart});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FittedBox(
                child: Text(
                  '\$${cart.price}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          title: Text(cart.title),
          subtitle: Text('Total: \$${cart.price * cart.quantity} '),
          trailing: Text('${cart.quantity} x'),
        ),
      ),
    );
  }
}
