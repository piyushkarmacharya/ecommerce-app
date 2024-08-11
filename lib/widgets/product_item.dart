import 'package:ecommerce_app/screens/product_details.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id, title, imageUrl;
  const ProductItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                )),
            backgroundColor: Colors.black54,
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
                onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ProductDetails.urlName, arguments: id);
            },
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
