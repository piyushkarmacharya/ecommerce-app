import 'package:ecommerce_app/stateManagement/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetails extends ConsumerWidget {
  static String urlName = "/product-details";

  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =
        ref.watch(productProvider).firstWhere((prod) => prod.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: Container(
        child: Text(loadedProduct.title),
      ),
    );
  }
}
