import 'package:flutter/material.dart';
import 'package:spark_demo/providers/cart.dart';
import 'package:spark_demo/providers/loading.dart';
import 'package:provider/provider.dart';
import 'package:spark_demo/providers/product.dart';
import 'package:spark_demo/screens/auth_screen.dart';
import 'package:spark_demo/screens/cart_screen.dart';
import 'package:spark_demo/screens/product_detail_screen.dart';
import 'package:spark_demo/screens/product_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Loading(),
        ),
        
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spark Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          backgroundColor: Colors.pink,
          accentColor: Colors.deepPurple,
          accentColorBrightness: Brightness.dark,
          buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor: Colors.pink,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthScreen(),
        // initialRoute: ProductOverViewScreen.routeName,
        routes: {
          ProductOverViewScreen.routeName: (_) => ProductOverViewScreen(),
          ProdcutDetailScreen.routeName :(_)=>ProdcutDetailScreen(),
          CartScreen.routeName :(_)=> CartScreen(),
        },
      ),
    );
  }
}
