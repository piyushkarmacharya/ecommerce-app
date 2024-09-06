import 'package:ecommerce_app/screens/cart_page.dart';
import 'package:ecommerce_app/stateManagement/providers/cart_provider.dart';
import 'package:ecommerce_app/stateManagement/providers/product_provider.dart';
import 'package:ecommerce_app/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsOverviewScreen extends ConsumerStatefulWidget {
  const ProductsOverviewScreen({super.key});
  @override
  ConsumerState<ProductsOverviewScreen> createState() =>
      _ProductsOverviewScreenState();
}

enum Filter { all, fav }

class _ProductsOverviewScreenState
    extends ConsumerState<ProductsOverviewScreen> {
  Filter selectedFilter = Filter.all;
  void setProducts() {
    ref.read(productProvider.notifier).addInitialProducts([
      Product(
          id: "001",
          title: "Red Shirt",
          description: "Cotton red Shirt",
          imageUrl:
              "https://th.bing.com/th/id/OIP.QVnOX2GSI7iY5fNPyCHdrwHaH8?rs=1&pid=ImgDetMain",
          price: 5000),
      Product(
          id: "002",
          title: "White Shirt",
          description: "Cotton white Shirt",
          imageUrl:
              "https://th.bing.com/th/id/R.7efa03f2898bf3f03f3ee3ea03c2c554?rik=oB4ImHRaw%2fp9Dw&pid=ImgRaw&r=0",
          price: 1000),
      Product(
          id: "003",
          title: "Green Shirt",
          description: "Cotton green Shirt",
          imageUrl:
              "https://th.bing.com/th/id/OIP.5jovBs6HnrBoiRBMBS2sUwHaJA?rs=1&pid=ImgDetMain",
          price: 1000),
      Product(
          id: "004",
          title: "Black Shirt",
          description: "Cotton Black Shirt",
          imageUrl:
              "https://th.bing.com/th/id/R.0fc59bca36b20f2ce4d4e998b3a00467?rik=KUxrBs7fHiqevQ&riu=http%3a%2f%2fbazaar.relywiz.com%2fwp-content%2fuploads%2f2018%2f10%2fBlack.jpg&ehk=8PEoe9YjdKjJKKQJLb5JolNEKvahgRrtzkjgNWf5zQY%3d&risl=&pid=ImgRaw&r=0",
          price: 1000),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                setState(() {
                  selectedFilter = value;
                });
              },
              itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: Filter.all,
                      child: Text("Show All"),
                    ),
                    PopupMenuItem(
                      value: Filter.fav,
                      child: Text("Show Favourite"),
                    ),
                  ]),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(CartPage.routeName);
            },
            child: Stack(
              children: [
                const Icon(Icons.shopping_cart,
                    size: 30.0), // The shopping cart icon

                Positioned(
                  bottom: 1,
                  left: 1,
                  right: 1,
                  top: 1,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      cart.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
        centerTitle: true,
        title: GestureDetector(
          onTap: setProducts,
          child: const Text(
            "My Shop",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ProductGrid(
        selectedFilter: selectedFilter,
      ),
    );
  }
}
