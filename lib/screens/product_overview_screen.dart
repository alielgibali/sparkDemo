import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_demo/providers/cart.dart';
import 'package:spark_demo/screens/cart_screen.dart';
import 'package:spark_demo/widgets/badge.dart.dart';
import 'package:spark_demo/widgets/product_grid.dart';

class ProductOverViewScreen extends StatelessWidget {
  static const routeName = 'product-overview-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
              child: ch,
              value: cartData.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
