import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartContents = Provider.of<Cart>(context, listen: true).items;
    return Row(
      children: [
      const Card(
        child: ListTile(
trailing: Text('Working'),
        )
      )
    ],);
  }
}