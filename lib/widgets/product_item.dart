import 'package:flutter/material.dart';
import 'package:state_management/screens/product_detailed_screen.dart';

class ProductItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;

  const ProductItem({Key? key, this.id, this.title, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetailedScreen.routeName, arguments: id);
      },
      child: GridTile(
        child: Hero(
          tag: title!,
          child: Image.network(
            imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(
            title!,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart, color: Colors.deepOrange)),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.deepOrange,
            ),
          ),
        ),
      ),
    );
  }
}
