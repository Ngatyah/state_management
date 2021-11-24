import 'package:flutter/material.dart';
import 'package:state_management/widgets/product_grid.dart';
class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kiosk moto moto'),
        ),
        body: const ProductGrid(),
    );
  }
}
