import 'package:eccomerce_app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final dynamic product;
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  


  @override
  Widget build(BuildContext context) {
    String msg = '';
    void delayTime(){
          showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(msg, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    
                    children: [
                      
                      ElevatedButton(onPressed: (){
                        Navigator.pushNamed(context,'/cartPage');
                      
                      }, child:const Icon(Icons.shopping_cart)),
                      const SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pop();
                      
                      }, child:const  Text('close', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)),
                    ],
                  )
                ],
              ),
            ),
          );
          
        }
        );
      
    };
    final cart = Provider.of<ProductModel>(context);

    


    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              height: 400,

              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.product['image']),fit: BoxFit.contain)
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width*0.8,
                  ),
                  child: Text(widget.product['title'], style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w900, color: Color.fromARGB(255, 131, 132, 133)),)),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text('\$${widget.product['price'].toString()}',style: const TextStyle(fontSize: 30,color: Color.fromARGB(255, 0, 170, 88), fontWeight: FontWeight.w900, fontFamily: 'serif'),),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(widget.product['description'].length > 200?'${widget.product['description'].substring(0,200)}...':widget.product['description'], style: TextStyle(),),
            ),
           
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  color: Colors.greenAccent 
                  ),
                
                  
                
              child:TextButton(onPressed:(){
                if(!Provider.of<ProductModel>(context,listen: false).isInCart(widget.product)){
                cart.addToCart(widget.product);
                setState(() {
                  msg = "added to cart";
                delayTime();
                  
                });
                }else{
                  setState(() {
                  msg = "Item already exist in cart";
                    
                  delayTime();
                    
                  });

                }
            
              },child:const  Text('Add to Cart',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),), ) ,)
          ],
        ),
      ),
      

    );
  }
}