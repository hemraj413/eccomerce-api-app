import 'package:eccomerce_app/components/main_part.dart';
import 'package:eccomerce_app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {

    var productModel = Provider.of<ProductModel>(context);
    return Scaffold(
      
         appBar: AppBar(
            title:const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text("Discover", style: TextStyle( fontSize: 20, fontWeight: FontWeight.w900),),
            ),
            automaticallyImplyLeading: false,
            actions:  [
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context,'/cartPage');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                color: Colors.greenAccent,

                ),
                child: Row(
                  children: [
                    const Icon(Icons.shopping_cart),
                    Text(productModel.cartItems.length.toString())
                  ],
                ),
              ),
            )
            ],
          ),
          body:ListView(
            children: const [
              Padding(padding: EdgeInsets.all(8),
              child: MainPart(),)
            ]
        
        ));
      
    
  }
}