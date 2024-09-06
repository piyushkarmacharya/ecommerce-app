import 'package:ecommerce_app/stateManagement/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerWidget {
  static String routeName = "/cart-page";
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: Row(
        children: [
          const Text("Total amt:  "),
          Chip(
              backgroundColor: Theme.of(context).primaryColor,
              label: Text(
                cart.getTotalAmount().toString(),
                style: const TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
