import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_demo/models/product.dart';
import 'package:spark_demo/providers/cart.dart';
import 'package:spark_demo/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  ProductItem({this.product});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProdcutDetailScreen.routeName, arguments: product);
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                product.title,
                textAlign: TextAlign.center,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.favorite),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(product.id, product.title, product.price);
              },
              color: Colors.orangeAccent,
            ),
          ),
        ),
      ),
    );
  }
}
