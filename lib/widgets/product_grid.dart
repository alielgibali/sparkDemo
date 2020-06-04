import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_demo/providers/product.dart';
import 'package:spark_demo/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key key,
 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final productsData= Provider.of<Products>(context,listen:false);
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: productsData.items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (_, i) => ProductItem(
        product: productsData.items[i],
        
      ),
    );
  }
}