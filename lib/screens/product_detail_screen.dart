import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_demo/models/product.dart';
import 'package:spark_demo/providers/product.dart';

class ProdcutDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail-screen';
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context).settings.arguments as Product;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(product.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              width: double.infinity,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true ,
              ),
            )
          ],
        ),
      ),
    );
  }
}
