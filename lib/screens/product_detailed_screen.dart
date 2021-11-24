import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/product_provider.dart';

class ProductDetailedScreen extends StatelessWidget {
  static const routeName = '/product-details';

  const ProductDetailedScreen({Key? key}) : super(key: key);
  // final String? title;

  // const ProductDetailedScreen({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct = Provider.of<ProductProvider>(context, listen: false).findById(productId);

    return Scaffold(appBar: AppBar(title: Text(loadedProduct.title!)),
    body: Center(child: Hero(
      tag:loadedProduct.title! ,
      child: Image.network(
            loadedProduct.imageUrl!,
            fit: BoxFit.cover,
          ),
    ),
        ),
    );
  }
}
