//import 'dart:html';

//import 'dart:html';
//import 'dart:math';

import 'package:buyit/constants.dart';
import 'package:buyit/models/product.dart';
import 'package:buyit/screens/add_product.dart';
import 'package:buyit/screens/edit_product.dart';
import 'package:buyit/screens/signup.dart';
import 'package:buyit/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ManageProducts extends StatelessWidget {
  static String id = 'manageproducts';
   final _store=Store();
  //String _store=Astore();
// void streempro()async{
//   _store.loadProducts();
//   await for (var snapshot in _store.loadProducts()) {
//    for(var product in snapshot.docs){
//      print(product.data());
//    }
//   }
// }

//========
 
 //Product product = ModalRoute.of(context).settings.arguments;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        stream:FirebaseFirestore.instance.collection(kProductsCollection).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            List<Product> products = [];
            for (var doc in snapshot.data!.docs) {
              var data = doc.data();
              products.add(Product(
               
                  pId: doc.id ,
                  pName:doc.get(kProductName),
                  pPrice: doc.get(kProductPrice),
                  pDescription: doc.get(kProductDescription) ,
                  //pImage: data[kProductImage],
                  pCategory: doc.get(kProductDescription),
                  pLocation :doc.get(kProductLocation),


              ));
            }
            //=====
 return GridView.builder(
   
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
              ),
              itemCount: products.length,
              //Text("${products[index].pName}"),
              itemBuilder: (context, index) => 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: GestureDetector(
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
                          
                              Navigator.pushNamed(context, EditProduct.id,arguments: products[index]);
                            Navigator.of(context).pushNamed(SignUp.id);

                          },
                          child: Text("edit")),
                        PopupMenuItem(
                          onTap: (){
                            //Navigator.pushNamed(context, EditProduct.id);
                            //Navigator.of(context).pushNamed(SignUp.id);
                            _store.deleteProduct(products[index].pId);

                          },
                          child: Text("delete")),

                      ]
                      
                      
                      
                      );
                  },


                  child: Stack(
                    children: [
                     // Text("${products[index].pName}"),
                     Positioned.fill(
                       child: Image(
                        fit: BoxFit.fill,
                         image: AssetImage("${products[index].pLocation}")
                         ),
                     ),
                
                    Positioned(
                      bottom: 0,
                      child: Opacity(
                        opacity: 0.6,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                             // mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${products[index].pName}",style: TextStyle(fontWeight: FontWeight.bold),),
                                Text("\$${products[index].pPrice}"),
                              ]),
                          ),
                        ),
                      ),
                    )
                
                
                    ],
                  ),
                ),
              )





            );
            //====
            // return ListView.builder(
             
            //   itemBuilder: (context, index) => Text("${products[index].pName}"),
            //   itemCount: products.length,
            // );
            //========
          }
          else {
            // I'm stuck in here
            return Center(child: Text('Loading...'));
          }
        },
      ),
    );
      
  
  
          
  
  }
}







// caffold(
// body: StreamBuilder<QuerySnapshot>(
//         stream: _store.loadProducts(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             List<Product> products = [];
//             for (var doc in snapshot.data.docoments) {
//               var data = doc.data;
//               products.add(Product(
//                   pId: doc.documentID,//documentID
//                   pPrice: data[kProductPrice],
//                   pName: data[kProductName],
//                   pDescription: data[kProductDescription],
//                   pLocation: data[kProductLocation],
//                   pCategory: data[kProductCategory]));
//             }

//             return ListView.builder(
//                  itemBuilder: (context, index) => Text(products[index].pName),
//                  itemCount: products.length,
//             ); 
 
//           }
//           else
//           {
//             return Center(child: Text("looooding"),)
//           }
 
//           }
          


          
// )
    
//     );








//Text("${products[index].pName}"),


// return GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: .8,
//               ),
//               itemBuilder: (context, index) => Text("${products[index].pName}"),
//               itemCount: products.length,
//             );