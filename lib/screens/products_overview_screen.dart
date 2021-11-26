import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/cart.dart';
import 'package:state_management/widgets/badge.dart';
import 'package:state_management/widgets/product_grid.dart';

enum FilterOptions { favorite, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}
class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavorite = false;
  @override
  Widget build(BuildContext context) {
    final cartContents = Provider.of<Cart>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kiosk moto moto'),
        actions: [
          Badge(
            key:widget.key,
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
              value: (cartContents.itemCount()).toString(),
              color: Colors.orange),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.radio_button_checked)),
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                if (selectedValue == FilterOptions.favorite) {
                  setState(() {
                    _showFavorite = true;
                  });
                  // productContainer.showFavorite();
                } else {
                  setState(() {
                    _showFavorite = false;
                  });
                  // productContainer.showAll();
                }
              },
              itemBuilder: (_) => [
                    const PopupMenuItem(
                        child: Text('Favorites'),
                        value: FilterOptions.favorite),
                    const PopupMenuItem(
                        child: Text('All Elements'), value: FilterOptions.all),
                  ])
        ],
      ),
      body: ProductGrid(
        isFavorite: _showFavorite,
      ),
    );
  }
}
