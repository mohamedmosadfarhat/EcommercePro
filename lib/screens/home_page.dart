import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/card_item.dart';
import 'package:ecommerce/screens/developers.dart';
import 'package:ecommerce/screens/edit_product.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/screens/navbar.dart';
import 'package:ecommerce/screens/product_info.dart';
import 'package:ecommerce/screens/signup.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/screens/about_app.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);
static String id ="homepage";

  @override
  State<HomePage> createState() => _HomePageState();
}
//List<Product> _products = [];
class _HomePageState extends State<HomePage> {
  final _store=Store();
  
//List<Product>? _products;
var _tabBarIndex=0;
var _bottombarindex=0;
List<Product> _products=[];

   // MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
   final w= MediaQuery.of(context).size.width;
    List<Product> _products = [];
    return Stack(
      children: [
        
        DefaultTabController(
          length: 4,
          child: Scaffold(
              backgroundColor: Colors.grey[10],
            drawer: MyDrawer(),
            
            appBar: AppBar(
              
             actions: [
                    IconButton(
                              icon: const Icon(Icons.shopping_cart),
                              
                              onPressed: () {
                                Navigator.pushNamed(context, CardItemScreen.id);
                              },
                    ), //IconButton
            
             ],
             iconTheme: IconThemeData(color: Colors.white,size: 25),
              backgroundColor: basiccolor,
              title: Row(
               // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                            'Sell Now'.toUpperCase(),
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                ],
              ),
                      
                       
                      //
             bottom: TabBar(
               
               indicatorColor: Colors.white,
               onTap: (value){
                  setState(() {
                    _tabBarIndex=value;
                  });
               },
              
               tabs: [
                
               Text("Jackets",style: TextStyle(
                      color: _tabBarIndex == 0 ? kSecondaryColor :kUnActiveColor,
                      fontSize: _tabBarIndex == 0 ? w*(.04) : null,),),
               Text("trousers",style: TextStyle(
                      color: _tabBarIndex == 1 ? kSecondaryColor : kUnActiveColor,
                      fontSize: _tabBarIndex == 1 ? w*(.04) : null,),),
               Text("T-shirt",style: TextStyle(
                      color: _tabBarIndex == 2 ? kSecondaryColor : kUnActiveColor,
                      fontSize: _tabBarIndex == 2 ? w*(.04) : null,),),
                     
               Text("Shoes",style: TextStyle(
                      color: _tabBarIndex == 3 ? kSecondaryColor: kUnActiveColor,
                      fontSize: _tabBarIndex == 3 ? w*(.04) : null,),),
              
              
             ],),
                     
                     ),
                     bottomNavigationBar: BottomNavigationBar(
             type: BottomNavigationBarType.fixed,
             fixedColor: kSecondaryColor,
            currentIndex: _bottombarindex,
             unselectedItemColor: kUnActiveColor,
            
            backgroundColor:basiccolor,
            onTap: (value) async{
            if(value==3)
            {
              SharedPreferences pref=await SharedPreferences.getInstance();
              pref.clear();
              Auth _auth=Auth();
              _auth.signOut();
              Navigator.popAndPushNamed(context,Login.id);
            }
            if(value==1)
            {
             Navigator.popAndPushNamed(context,AboutApp.id);
            
            } if(value==2)
            {
             Navigator.popAndPushNamed(context,Developers.id);
            
            }
            // else{
            
            //  Navigator.popAndPushNamed(context,Profile.id);
            
            // }
            setState(() {
            _bottombarindex=value;
              
            });
            },
                items: [
            
               BottomNavigationBarItem(
                   label: "home page",
                  icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                    label: "about app",
                 icon: Icon(Icons.app_shortcut_sharp)),
                   BottomNavigationBarItem(
                   label: "about us",
                  icon: Icon(Icons.person)),
            
                 BottomNavigationBarItem(
                   label: "sign out",
                 icon: Icon(Icons.close)),
                ]
            ),
            
                     
            
            body: TabBarView(
              children: [
               productview(kJackets),
               productview(kTrousers),
               productview(kTshirts),
               productview(kShoes),
           
              ],
            ),
           
          ),
        )
    ,
    //=========
          //  Material(
          //    child: Padding(
          //      padding: const EdgeInsets.fromLTRB(20,30,20,0),
          //      child: Container(
          //         height: MediaQuery.of(context).size.height * .1,
          //         child: Row(
          //            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
    
          //             Text(
          //               'Sell Now'.toUpperCase(),
          //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //             ),
                      
          //             GestureDetector(
          //                 onTap: () {
          //                  // Navigator.pop(context);
          //               Navigator.pushNamed(context, CardItemScreen.id);
          //               // Navigator.pop(context);
          //                 },
          //                 child: Icon(Icons.shopping_cart)),
          //             // GestureDetector(
          //             //   onTap: () {
          //             //     // Navigator.pop(context);
          //             //     Navigator.pushNamed(context, CardItemScreen.id);
          //             //     // Navigator.pop(context);
          //             //   },
          //             //   child: Text(
          //             //     'about us',
          //             //     style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          //             //   ),
          //             //   ),
          //           ],
          //         ),
          //       ),
          //    ),
          //  ),
        
           //========
      ],
    );
  }
}
Widget productview(String productcatogory){
  return  StreamBuilder<QuerySnapshot>(
        stream:FirebaseFirestore.instance.collection(kProductsCollection).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            List<Product> products = [];
            for (var doc in snapshot.data!.docs) {
              var data = doc.data();
              if(doc[kProductCategory]== productcatogory  ){
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
            }
         
            //=====
 return GridView.builder(
   
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
              ),
              itemCount: products.length,
              //Text("${products[index].pName}"),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 10),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, ProductInfo.id,arguments: products[index]);
                  },
                  child: Stack(
                    children: [
                             Positioned.fill(
                              child: Image(
                              fit: BoxFit.fill,
                               image: AssetImage("${products[index].pLocation}")
                               ),
                            ),
                            //============
                     Positioned(
                            bottom: 0,
                            child: Opacity(
                              opacity: 0.6,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                   // mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                      Text("${products[index].pName}",style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text("\$${products[index].pPrice}"),
                                    ]),
                                ),
                              ),
                            ),
                          )
                            //==============
                              
                    ],
                              
                  ),
                ),
              )
          
         




            );
          }
          else {
            // I'm stuck in here
            return Center(child: CircularProgressIndicator());
          }
        },
      );

   
}

