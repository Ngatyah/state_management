import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kiosk moto moto'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.login)),
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
      body: ProductGrid(isFavorite: _showFavorite,),
    );
  }
}
