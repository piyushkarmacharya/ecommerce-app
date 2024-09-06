import 'package:ecommerce_app/stateManagement/providers/cart_provider.dart';
import 'package:ecommerce_app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerWidget {
  static String routeName = "/cart-page";
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProviderr = ref.watch(cartProvider.notifier);
    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total amt:  "),
                Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      cartProviderr.getTotalAmount().toString(),
                      style: const TextStyle(color: Colors.white),
                    )),
              ],
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: cart.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, i) {
                    return ProductItem(id: cart[i].product.id);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
