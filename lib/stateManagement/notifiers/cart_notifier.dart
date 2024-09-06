import 'package:ecommerce_app/models/cart_item.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addProduct(Product p, int qty) {
    final existingProductIndex =
        state.indexWhere((cartItem) => cartItem.product.id == p.id);
    if (existingProductIndex == -1) {
      state = [...state, CartItem(product: p, qty: qty)];
    } else {
      state = [
        for (final cartItem in state)
          if (cartItem.product.id == p.id)
            cartItem.copyWith(product: p, qty: cartItem.qty + qty)
          else
            cartItem,
      ];
    }
  }

  double getTotalAmount() {
    double amt = 0.0;
    for (final cartItem in state) {
      amt = amt + (cartItem.qty * cartItem.product.price);
    }
    return amt;
  }
}
