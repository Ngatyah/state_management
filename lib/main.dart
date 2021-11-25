import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/cart.dart';
import 'package:state_management/providers/product_provider.dart';
import 'package:state_management/screens/product_detailed_screen.dart';
import 'package:state_management/screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
      create: (context)=>ProductProvider(),),
     ChangeNotifierProvider(
      create: (context)=>Cart(),),
      ],
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailedScreen.routeName: (context)=> const ProductDetailedScreen(),
        },
      ),
    );
  }
}
