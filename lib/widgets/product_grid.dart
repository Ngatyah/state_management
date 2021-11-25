import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool isFavorite;
  const ProductGrid({
    Key? key,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final products =isFavorite? productData.getFavorites:productData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (cxt, i) => ChangeNotifierProvider.value(
              value: products[i],
              child: const ProductItem(
                  // id: products[i].id,
                  // title: products[i].title,
                  // imageUrl: products[i].imageUrl,
                  ),
            ));
  }
}
