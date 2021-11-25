import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../screens/product_detailed_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  

  // final String? id;
  // final String? title;
  // final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(context, listen: true);
    return Consumer<Product>(
     builder: (context,product,child)=>InkWell(
       onTap:() {
        Navigator.of(context)
            .pushNamed(ProductDetailedScreen.routeName, arguments: product.id);
} ,
       child: ClipRRect(
         borderRadius: BorderRadius.circular(10),
         child: GridTile(
            child: Hero(
              tag: product.title!,
              child: Image.network(
                product.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black45,
              title: Text(
                product.title!,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart, color: Colors.deepOrange)),
              leading: IconButton(
                onPressed: () {
                  product.toggleFavorite();
                },
                icon: Icon(product.isFavorite?
                  Icons.favorite:Icons.favorite_border,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ),
       ),
     ),
    );
  }
}
