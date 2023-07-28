import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/manage_product.dart';
import 'package:ecommerce/screens/add_product.dart';
import 'package:ecommerce/screens/edit_product.dart';
import 'package:ecommerce/screens/order_screen.dart';
import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  const Admin({ Key? key }) : super(key: key);
static String id = "admin";
  @override
  Widget build(BuildContext context) {
    final  h= MediaQuery.of(context).size.height;
    final w= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[140],
     body: Center(
       
       child: Padding(
         padding: const EdgeInsets.all(5),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
         // mainAxisAlignment:MainAxisAlignment.Center
           Container(
             width: w*0.9,
             height: h*0.15,
             decoration: BoxDecoration(

                 borderRadius: BorderRadius.circular(80)
             ),
             child: ElevatedButton(onPressed: (){
                  
                  Navigator.of(context).pushNamed(AddProduct.id);
             },
                  //     style: ButtonStyle(backgroundColor:kMainColor),
                  // style: ElevatedButton.styleFrom(
                  //   backgroundColor: kSecondaryColor2
                  //      //  primary: Colors.deepOrangeAccent,
                  //       //onPrimary: Colors.black,
                  //      ),
                 style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.grey[100]
                   //  primary: Colors.deepOrangeAccent,
                   //onPrimary: Colors.black,
                 ),
              child: Text("Add product",style: TextStyle(fontSize: 40,color: Colors.black),)),
           ),
       
       
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: w*0.9,
                height: h*0.15,

                child: ElevatedButton(onPressed: (){
                    Navigator.of(context).pushNamed(ManageProducts.id);
                     
                },
                style: ElevatedButton.styleFrom(  
                     backgroundColor: Colors.grey[100]
                        //  primary: Colors.deepOrangeAccent,
                          //onPrimary: Colors.black,
                        ),
                         child: Text("Edit product",style: TextStyle(fontSize: 40,color: Colors.black),)),
              ),
            ),
       
       
            Container(
              width: w*0.9,
              height: h*0.15,
              child: ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, OrdersScreen.id);
              },
              style: ElevatedButton.styleFrom(  
                   backgroundColor: Colors.grey[100]
                      //  primary: Colors.deepOrangeAccent,
                        //onPrimary: Colors.black,
                      ),
              child: Text("View product",style: TextStyle(fontSize: 40,color: Colors.black),)),
            ),
       
       
       
            ],),
       )),
    );
  }
}