import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  static String urlName = "/product-details";

  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: Container(),
    );
  }
}
