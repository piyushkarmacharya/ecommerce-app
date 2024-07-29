import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id, title, imageUrl;
  ProductItem({required this.id, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
          trailing:
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ));
  }
}
