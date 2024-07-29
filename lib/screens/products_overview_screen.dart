import 'package:ecommerce_app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProduct = [
    Product(
        id: "001",
        title: "Red Shirt",
        description: "Cotton red Shirt",
        imageUrl:
            "https://th.bing.com/th/id/OIP.QVnOX2GSI7iY5fNPyCHdrwHaH8?rs=1&pid=ImgDetMain",
        price: 1000),
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
  ];
  ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XYZ Shop"),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: loadedProduct.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, i) {
            return ProductItem(
                id: loadedProduct[i].id,
                title: loadedProduct[i].title,
                imageUrl: loadedProduct[i].imageUrl);
          }),
    );
  }
}
