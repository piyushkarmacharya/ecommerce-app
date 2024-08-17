import 'package:ecommerce_app/screens/product_details.dart';
import 'package:ecommerce_app/stateManagement/providers/cart_provider.dart';
import 'package:ecommerce_app/stateManagement/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductItem extends ConsumerWidget {
  final String id;
  const ProductItem({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product =
        ref.watch(productProvider).firstWhere((prod) => prod.id == id);
    final cartNotifier = ref.read(cartProvider.notifier);
    final cart = ref.watch(cartProvider);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(

          // header: GridTileBar(
          //   title: Container(),
          //   trailing: IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         Icons.favorite,
          //       )),
          // ),
          footer: GridTileBar(
            leading: IconButton(
                onPressed: () {
                  ref.read(productProvider.notifier).changeFavourite(id);
                },
                icon: Icon(
                  product.isFavorite == true
                      ? Icons.favorite
                      : Icons.favorite_border,
                )),
            backgroundColor: Colors.black54,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: () {
                cartNotifier.addProduct(product, 10);
              },
              icon: Icon(
                  cart.indexWhere((cartItem) => cartItem.product.id == id) != -1
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ProductDetails.urlName, arguments: id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
