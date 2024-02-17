import 'package:eccomerce_app/components/category_btn.dart';
import 'package:eccomerce_app/components/produc_item.dart';
import 'package:eccomerce_app/model/product.dart';
import 'package:eccomerce_app/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPart extends StatefulWidget {
  const MainPart({super.key});

  @override
  State<MainPart> createState() => _MainPartState();
}

class _MainPartState extends State<MainPart> {
  late ProductModel productItems;
  bool isLoading = true;



    @override
  void initState() {
    super.initState();
    productItems = Provider.of<ProductModel>(context, listen: false);
   
    showProducts();
    
    

  }
  Future<void> showProducts()async{
    try{
      final productMod = Provider.of<ProductModel>(context, listen: false);
      await productMod.fetchProduct();

    }catch(error){
      throw Exception("can't load page error");

    }finally{
      setState(() {
        isLoading = false;
      });
    }

    
    setState(() {
    Provider.of<ProductModel>(context,listen: false).fetchProduct();

     Provider.of<ProductModel>(context,listen: false).filterList("All");
      
    });
  
    

      

    
  }

  String selectCategory ="All";
  final TextEditingController _searchController = TextEditingController();
  final String _searchText = '';






  @override
  
  Widget build(BuildContext context) {
    late List products = productItems.filteredProducts;


  double height = MediaQuery.of(context).size.height;
  
  


    return SizedBox(
  
  height: height,
      child: ListView(
        
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Enter search term',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                    
                  ),
          ),
          const Text("Categories", style: TextStyle( fontSize: 22, fontWeight: FontWeight.w800),),
           SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryButton(categoryText: "All", color:selectCategory=="All"? Colors.white:Colors.black, backgroundColor: selectCategory=='All'?Colors.greenAccent:Colors.white
                ,buttoonPressed: (){
                  setState(() {
                    selectCategory="All";
                    Provider.of<ProductModel>(context,listen: false).filterList("All");
                    
                  });


                }),
                CategoryButton(categoryText: "Men", backgroundColor:selectCategory=="Men"?Colors.greenAccent: Colors.white, color: selectCategory=="Men"? Colors.white:Colors.black,
                buttoonPressed: (){
                  setState(() {
                    selectCategory="Men";
                    Provider.of<ProductModel>(context,listen: false).filterList("men's clothing");

                  });


                }),
                CategoryButton(categoryText: "Women", backgroundColor:selectCategory=="Women"?Colors.greenAccent: Colors.white, color: selectCategory=="Women"? Colors.white:Colors.black,
                buttoonPressed: (){
                  setState(() {
                    selectCategory = "Women";
                    Provider.of<ProductModel>(context,listen: false).filterList("women's clothing");


                  });


                }),
                CategoryButton(categoryText: "Electronics", backgroundColor:selectCategory=="Electronics"?Colors.greenAccent: Colors.white, color: selectCategory=="Electronics"? Colors.white:Colors.black,
                buttoonPressed: (){
                  setState(() {
                    selectCategory="Electronics";
                    Provider.of<ProductModel>(context,listen: false).filterList('electronics');

                  });



                }),
                 CategoryButton(categoryText: "Jewelery", backgroundColor:selectCategory=="Jewelery"?Colors.greenAccent: Colors.white, color: selectCategory=="Jewelery"? Colors.white:Colors.black,
                buttoonPressed: (){
                  setState(() {
                    selectCategory="Jewelery";
                    Provider.of<ProductModel>(context,listen: false).filterList("jewelery");

                  });


                })
            
                
                
            
            
            ],),
          ),
          !isLoading?Container(
            height: height*0.65,
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(products.length, (index){
                final product =products[index];
                return
                  ProductItem(category: product['category'], image: product['image'], price: product['price'], title: product['title'],prod:(){
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductPage(product: product,),
                      ),
                    );
                    // Navigator.pushNamed(context, '/productPage', arguments: products[index]);
                  },);
            
              }),
              // gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              // itemCount: products.length,
              // itemBuilder: (context, index){
              //   final product = products[index];
              //     return 
               
                ),
          ):
              const Center(child: CircularProgressIndicator(),),
              

          ]),
          

      );
      
    
  }
}