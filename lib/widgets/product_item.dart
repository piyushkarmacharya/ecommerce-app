import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id, title, imageUrl;
  ProductItem({required this.id, required this.title, required this.imageUrl});

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
                icon: Icon(
                  Icons.favorite,
                )),
            backgroundColor: Colors.black54,
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
            trailing:
                IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          )),
    );
  }
}
