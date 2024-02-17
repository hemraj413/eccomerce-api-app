import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final String image;
  final String title;
  final num price;
  final String category;
  VoidCallback removeBtn;

  CartItem({super.key, required this.image,required this.price,required this.removeBtn,required this.title, required this.category});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.all(8.0) ,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.black)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100,
            width: 70,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(widget.image), fit: BoxFit.contain)
            ),
          ),
          SizedBox(
                width: MediaQuery.of(context).size.width*0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(widget.title, maxLines: 2, style:const TextStyle(fontSize:18, fontWeight: FontWeight.w700 ),),
                Text(widget.category),
                Text('\$ ${widget.price.toString()}', style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800, ),)
              ],
            ),
          ),
          TextButton(onPressed: (){
            setState(() {
              
            });
            widget.removeBtn();
          }, child: const Icon(Icons.close))
        ],
      ),
    );
  }
}