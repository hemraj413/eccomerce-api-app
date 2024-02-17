import 'package:flutter/material.dart';




class ProductItem extends StatelessWidget {
  final String title;
  final num price;
  final String image;
  final String category;
  final VoidCallback prod;
 const ProductItem({super.key,required this.category,required this.image, required this.price,required this.title, required this.prod});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        prod();

      
      },
      child: Container(
        padding: const EdgeInsets.all(3),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: .5,color: const Color.fromARGB(255, 202, 200, 200))
        ),
        child:ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              height: 110,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image),
                fit: BoxFit.contain),
      
            ),),
            Text(title, maxLines:2, style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color: Colors.grey),),
            Text('\$${price.toString()}',style:const TextStyle(fontSize: 18,fontWeight: FontWeight.w900 ),),
          
      
          ],
        ),
      ),
    );
  }

  static fromJson(data) {}
}