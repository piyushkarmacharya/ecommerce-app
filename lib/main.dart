import "package:flutter/material.dart";
import "screens/products_overview_screen.dart";

void main() {
  runApp(MyApp());
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
        appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey),
        fontFamily: "Lato",
      ),
      home: ProductsOverviewScreen(),
    );
  }
}
