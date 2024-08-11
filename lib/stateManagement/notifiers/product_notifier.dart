import 'package:ecommerce_app/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super([]);
  void addInitialProducts(List<Product> p) {
    state = p;
  }

  void addProduct(Product p) {
    state = [...state, p];
  }
}
