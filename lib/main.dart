import "package:ecommerce_app/screens/product_details.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'screens/cart_page.dart';

import "screens/products_overview_screen.dart";

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ecommerce",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
        fontFamily: "Lato",
      ),
      home: const ProductsOverviewScreen(),
      routes: {
        ProductDetails.urlName: (context) => const ProductDetails(),
        CartPage.routeName: (context) => const CartPage(),
      },
    );
  }
}
