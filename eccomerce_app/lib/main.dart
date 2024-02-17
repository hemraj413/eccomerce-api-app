import 'package:eccomerce_app/Home_page.dart';
import 'package:eccomerce_app/cart_page.dart';
import 'package:eccomerce_app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
    ChangeNotifierProvider(create: (context)=>ProductModel(),
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => const HomePage(),
        '/cartPage':(context)=>const CartPage()
      },
      initialRoute: '/',
    ) ,
    );
  }
}