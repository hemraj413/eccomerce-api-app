import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ProductModel extends ChangeNotifier{
  late List<dynamic> _products =[];
  late List<dynamic> _cartItems =[];
  late List<dynamic> filteredProducts=[] ;
  bool canFilter = false;

  Future<void> fetchProduct()async{
    var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if(response.statusCode ==200){
      
      _products = json.decode(response.body);
      canFilter = true;
      filteredProducts = json.decode(response.body);
      notifyListeners();
    }else{
      throw Exception("failed to load products");
    }

    
  }

  List<dynamic> get products => _products;
  List<dynamic> get cartItems =>_cartItems;

  void filterList(String category){
    if(category =='All'){
      filteredProducts = _products;
    }else{
    filteredProducts = _products.where((element) => element['category']==category).toList();

    }
  }

void addToCart(product){
  _cartItems.add(product);
  notifyListeners();

}

void removeFromCart(product){
  _cartItems.remove(product);
  notifyListeners();
}

  bool isInCart(product) {
    return _cartItems.contains(product);
  }




}