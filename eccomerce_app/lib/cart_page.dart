import 'package:eccomerce_app/components/cart_item.dart';
import 'package:eccomerce_app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
     var modal = Provider.of<ProductModel>(context, listen:false);
    late List cartProduct = Provider.of<ProductModel>(context, listen:false).cartItems;
    return Scaffold(
      appBar: AppBar(
        title: const Text("cart items"),

      ),
      body:cartProduct.isNotEmpty? Container(
        child: ListView.builder(
          itemCount:cartProduct.length ,
          itemBuilder: (context, index) {
            final product = cartProduct[index];
            return CartItem(image: product['image'], price: product['price'], removeBtn: (){
              setState(() {
              modal.removeFromCart(product);
                
              });
              

            }, title: product['title'], category: product['category']);
          },
          ),
      ):const Center(child: Text('no cart available')),
    );
  }
}