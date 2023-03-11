import 'dart:math';

import 'package:buyit/constants.dart';
import 'package:buyit/models/product.dart';
import 'package:buyit/prvider/card_item.dart';
import 'package:buyit/screens/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//int quantity=0;
class ProductInfo extends StatefulWidget {
  //const ProductInfo({ Key? key }) : super(key: key);
 static String id="ProductInfo";
//int quantity=0;
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int quantity=1;
  @override
  Widget build(BuildContext context) {
    List o=[];
   // int quantity=1;
   Product product = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage("${product.pLocation}"),
            ),
            //======
           
            //======
          ),
          //=====
           Padding(
               padding: const EdgeInsets.fromLTRB(20,30,20,0),
               child: Container(
                  height: MediaQuery.of(context).size.height * .1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios)),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed(CardItemScreen.id);
                        },
                        child: Icon(Icons.shopping_cart)),

                    ],
                  ),
                ),
             ),
          //======


          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  Opacity(
                    opacity: .5,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*.3,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("${product.pName}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          //Text("${product.pPrice}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w900),),
                          Text("${product.pDescription}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("${product.pPrice} \$",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                              Text("\$",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                              
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Material(
                                  color: Colors.green,
                                  child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        quantity++;
                                      });
                                    

                                    },
                                    child: SizedBox(
                                      width: 28,
                                      height: 28,
                                      child: Icon(Icons.add),
                                      
                                    ),
                                  ),
                                ),
                              ),
                             // SizedBox(height: 10,),
                              Text("${quantity.toString()}",style: TextStyle(fontSize: 50),),
                               ClipOval(
                                child: Material(
                                  color: Colors.green,
                                  child: GestureDetector(
                                    onTap: (){
                                      if(quantity>0)
                                      {
                                        setState(() {
                                          quantity--;
                                        });
                                      }
                                    },
                                    child: SizedBox(
                                      width: 28,
                                      height: 28,
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                ),
                              ),

                            ],


                          )

                         
                        ]),
                      ),
                  
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.zero,),
                    height: MediaQuery.of(context).size.height*.1,
                    width: MediaQuery.of(context).size.width,
                    child: Builder(
                      builder: (context) {
                        return ElevatedButton(onPressed: (){
                           

                 CartItem cartItem= Provider.of<CartItem>(context,listen: false);
                 product.pQuantity=quantity;
                 bool exist=false;
                 var productsincart=cartItem.products;
                for (var productincart in productsincart) {
                  if(productincart.pName==product.pName)
                  {
                     exist=true;
                  }
                }
                if(exist)
                {
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("already added")));

                }else{
                cartItem.addProduct(product);

                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added to cart")));


                }
                        }, 
                          style: ElevatedButton.styleFrom(  
                             backgroundColor: Colors.green
                                
                                ),
                                
                        child: Text("Add to cart".toUpperCase(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),));
                      }
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      
    );
  }

  
}


//  CartItem cartItem= Provider.of<CartItem>(context,listen: false);
//                  product.pQuantity=quantity;
//                 cartItem.addProduct(product);
//                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added to cart")));
