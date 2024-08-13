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

  void changeFavourite(String id) {
    state = [
      for (final prod in state)
        if (prod.id == id)
          prod.copyWith(isFavorite: !prod.isFavorite)
        else
          prod,
    ];
  }
}
