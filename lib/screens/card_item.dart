import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/prvider/card_item.dart';
import 'package:ecommerce/screens/edit_product.dart';
import 'package:ecommerce/screens/product_info.dart';
import 'package:ecommerce/screens/signup.dart';
import 'package:ecommerce/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:provider/provider.dart';

class CardItemScreen extends StatelessWidget {
  //const CardItemScreen({ Key? key }) : super(key: key);
 static String id ="Card Item";
   final _store=Store();

  @override
  Widget build(BuildContext context) {
    List<Product> products=Provider.of<CartItem>(context).products;
    final double height=MediaQuery.of(context).size.height;
    final botorder=height*.09;
    final double width=MediaQuery.of(context).size.width;
    final apparhieght=AppBar().preferredSize.height;
    final statuspar=MediaQuery.of(context).padding.top;
    return Scaffold(
     //resizeToAvoidBottomPadding: false,
     resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: basiccolor,
        title: Text("My Cart",style: TextStyle(color: Colors.white),),),
      body: Column(
        
        children: [
          Expanded(
          child: ListView.builder(
            itemBuilder: ((context, index)
          {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                 //=================
onTapUp: (details){
                     double dx = details.globalPosition.dx;
                    double dy = details.globalPosition.dy;
                    double dx2 = MediaQuery.of(context).size.width - dx;
                    double dy2 = MediaQuery.of(context).size.width - dy;

                    showMenu(context: context,
                     position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                      items: [
                        PopupMenuItem(
                          onTap: () {
                          
                            //  Navigator.pushNamed(context, EditProduct.id,arguments: products[index]);
      
                           // Navigator.of(context).pushNamed(SignUp.id);
                           // Navigator.pop(context);
                         // Provider.of<CartItem>(context,listen: false).deleteProduct(products[index]);
                          //
                          //  Navigator.of(context).pushNamed(ProductInfo.id,arguments: products[index]);
                           // Navigator.pushNamed(context, ProductInfo.id,arguments: products[index]);
                            //Navigator.pop(context);
                            // Navigator.of(context).pushNamed(SignUp.id);
                            //Navigator.of(context).pushNamed(SignUp.id);
                           Navigator.pop(context);
                           
                             Navigator.pushNamed(context, ProductInfo.id,arguments: products[index]);
                             Navigator.of(context).pushNamed(SignUp.id);
                           Provider.of<CartItem>(context,listen: false).deleteProduct(products[index]);

                           
                            
                          },
                          child: Text("edit")),
                        PopupMenuItem(
                          onTap: (){
                           Provider.of<CartItem>(context,listen: false).deleteProduct(products[index]);
                           // _store.deleteProduct(products[index].pId);

                          },
                          child: Text("delete")),

                      ]
                      
                      
                      
                      );
                  },


                 //=================

                  child: Container(
                    decoration: BoxDecoration(
                           color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(18)
                          ),
                    height: height*.2,
                    width: width,
                   // color: kSecondaryColor,
                    child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               CircleAvatar(
                                 radius: height*.15/2,
                                 backgroundImage: AssetImage("${products[index].pLocation}"),
                                 ),
                                   
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text("${products[index].pName}",style: TextStyle(fontSize: 20),),
                                     SizedBox(height: 10,),
                                     Text("${products[index].pPrice.toString()} \$",style: TextStyle(fontSize: 18),)
                                   ],
                                 ),
                                  Padding(
                                       padding: const EdgeInsets.only(right:26),
                                        child: Text("${products[index].pQuantity.toString()} ",style: TextStyle(fontSize: 18),),
                                      ),
                                      //=======
                                      
                                      //=======
                          
                          
                    
                             ]
                    ),
                    //======
                   
                    //=====
                    
                    
                  ),
                ),
              );
             
          
          }
          ),
          itemCount: products.length,
          ),
          ),
          //=====
          Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
              width: width,
              height: botorder,
              child: ElevatedButton(onPressed: (){
                //=====
                
                showDialogj(products,context);
               

              },
              style: ElevatedButton.styleFrom(  
                                 backgroundColor:basiccolor,
                                 
                                    
                                    ),
                                    
               child: Text("order".toUpperCase())),
            ),
          )

          //====



        ],
      ),
    );
  
   
   }
   void showDialogj(List<Product> products,context, )
                {
                  var price =getprice(products);
                  var adress;
                AlertDialog alertDialog=AlertDialog(
                  actions: [
                    MaterialButton(onPressed: (){
                     if(adress!=null&&adress.length>4){
                     try{
                      Store _store=Store();
                      _store.storeOrders({
                       kProductPrice:price,
                       kAddress:adress
                      }
                      , products) ;
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("order done")));
                   Navigator.pop(context);      
                     }catch(e)
                     {
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${e}")));

                     }

                     }else{
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter the adress  more than 8 characters")));

                     }
                    },
                    child: Text("confirm"),
                    )
                  ],
                  title: Text("total price = \$ ${price}"),
                  content: TextField(
                    onChanged: (value){
                        adress=value;
                    },
                    decoration:InputDecoration (
                    hintText: "enter your adress"


                  )
                    
                  ),
                );

                 showDialog(context: context, builder: (context)
              {
              return alertDialog;
              }
              );
                
                // showModalBottomSheet(context: context, builder: (context)
                // {
                   
                  
                 // return alertDialog;
                // return Container(
                //   width: 3,
                //   color: Colors.amber,
                //   child: alertDialog,
                // );
                // }
                // );
                  
                  //==
                }
   getprice(List<Product> products){
     var price=0;
    for (var product in products) {
      price+=product.pQuantity! *int.parse(product.pPrice!) ;
    }
    return price;

   }


}


  




























