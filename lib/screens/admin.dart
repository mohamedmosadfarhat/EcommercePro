import 'package:buyit/constants.dart';
import 'package:buyit/models/manage_product.dart';
import 'package:buyit/screens/add_product.dart';
import 'package:buyit/screens/edit_product.dart';
import 'package:buyit/screens/order_screen.dart';
import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  const Admin({ Key? key }) : super(key: key);
static String id = "admin";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
     body: Center(
       
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
       // mainAxisAlignment:MainAxisAlignment.Center
         ElevatedButton(onPressed: (){

              Navigator.of(context).pushNamed(AddProduct.id);
         },
        // style: ButtonStyle(backgroundColor:kMainColor),
             style: ElevatedButton.styleFrom(  
               backgroundColor: kSecondaryColor2
                  //  primary: Colors.deepOrangeAccent,
                    //onPrimary: Colors.black,
                  ),

          child: Text("Add product")),


          ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed(ManageProducts.id);

          },
          style: ElevatedButton.styleFrom(  
               backgroundColor: kSecondaryColor2
                  //  primary: Colors.deepOrangeAccent,
                    //onPrimary: Colors.black,
                  ),
         child: Text("Edit product")),


          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, OrdersScreen.id);
          },
          style: ElevatedButton.styleFrom(  
               backgroundColor: kSecondaryColor2
                  //  primary: Colors.deepOrangeAccent,
                    //onPrimary: Colors.black,
                  ),
          child: Text("View product")),



     ],)),
    );
  }
}