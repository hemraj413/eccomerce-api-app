import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String categoryText;
  final Color backgroundColor;
  final Color color;
  final VoidCallback buttoonPressed;
  const CategoryButton({super.key, required this.categoryText, required this.backgroundColor, required this.color, required this.buttoonPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      buttoonPressed();
    
    }, child: Container(
    padding: const EdgeInsets.only(left: 8,right: 8, top: 5,bottom: 5),
    decoration: BoxDecoration(
      border: Border.all(width: 1,),
      borderRadius: BorderRadius.circular(10),
      color: backgroundColor,


    ),

    child: Text(categoryText, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: color),),
    ));
  }
}