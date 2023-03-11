import 'package:buyit/models/product.dart';
import 'package:buyit/screens/card_item.dart';
import 'package:buyit/screens/edit_product.dart';
import 'package:buyit/screens/login.dart';
import 'package:buyit/screens/product_info.dart';
import 'package:buyit/screens/signup.dart';
import 'package:buyit/services/auth.dart';
import 'package:buyit/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  fixedColor: kMainColor,
  currentIndex: _bottombarindex,
  //backgroundColor: Colors.black,
  onTap: (value) async{
    if(value==2)
    {
      SharedPreferences pref=await SharedPreferences.getInstance();
      pref.clear();
      Auth _auth=Auth();
      _auth.signOut();
      Navigator.popAndPushNamed(context,Login.id);
    }
    setState(() {
_bottombarindex=value;
      
    });
  },
        items: [
          
              //  BottomNavigationBarItem(
              //    label: "hg",
              //    icon: Icon(Icons.person)
              //    ),
                  BottomNavigationBarItem(
                    label: "hgc",
                 icon: Icon(Icons.person)),
                 BottomNavigationBarItem(
                   label: "gh",
                  icon: Icon(Icons.person)),
                 BottomNavigationBarItem(
                   label: "sign out",
                 icon: Icon(Icons.close)),

]),

           appBar: AppBar(
             backgroundColor: Colors.white,
             bottom: TabBar(
               
               indicatorColor: kMainColor,
               onTap: (value){
                  setState(() {
                    _tabBarIndex=value;
                  });
               },
               tabs: [
               Text("Jackets",style: TextStyle(
                      color: _tabBarIndex == 0 ? Colors.black : kUnActiveColor,
                      fontSize: _tabBarIndex == 0 ? w*(.04) : null,),),
               Text("trousers",style: TextStyle(
                      color: _tabBarIndex == 1 ? Colors.black : kUnActiveColor,
                      fontSize: _tabBarIndex == 1 ? w*(.04) : null,),),
               Text("T-shirt",style: TextStyle(
                      color: _tabBarIndex == 2 ? Colors.black : kUnActiveColor,
                      fontSize: _tabBarIndex == 2 ? w*(.04) : null,),),
               Text("Shoes",style: TextStyle(
                      color: _tabBarIndex == 3 ? Colors.black : kUnActiveColor,
                      fontSize: _tabBarIndex == 3 ? w*(.04) : null,),),


             ],),
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
           Material(
             child: Padding(
               padding: const EdgeInsets.fromLTRB(20,30,20,0),
               child: Container(
                  height: MediaQuery.of(context).size.height * .1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Discover'.toUpperCase(),
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                          onTap: () {
                           // Navigator.pop(context);
                        Navigator.pushNamed(context, CardItemScreen.id);
                        Navigator.pop(context);
                          },
                          child: Icon(Icons.shopping_cart))
                    ],
                  ),
                ),
             ),
           ),
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
           // List<Product> _products = [];

    //       _products = [...products];     
    //   products.clear();
    //       for (var product in _products) {
    //   if (product.pCategory == kJackets) {
    //     products.add(product);
    //   }
    // }
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
          
              
              //  Stack(
              //    cheldern[
                 
              //  Positioned.fill(
              //            child: Image(
              //             fit: BoxFit.fill,
              //              image: AssetImage("${products[index].pLocation}")
              //              ),
              //          ),
                  
              //         Positioned(
              //           bottom: 0,
              //           child: Opacity(
              //             opacity: 0.6,
              //             child: Container(
              //               width: MediaQuery.of(context).size.width,
              //               height: 60,
              //               color: Colors.white,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Column(
              //                  // mainAxisAlignment: MainAxisAlignment.center,
              //                  children: [
              //                     Text("${products[index].pName}",style: TextStyle(fontWeight: FontWeight.bold),),
              //                     Text("\$${products[index].pPrice}"),
              //                   ]),
              //               ),
              //             ),
              //           ),
              //         )
                  
                  
              //         ],
                 //   ),
           // ),
            
               // ),
              //)





            );
          }
          else {
            // I'm stuck in here
            return Center(child: Text('Loading...'));
          }
        },
      );

   
}











































  //  Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
  //               child: GestureDetector(
  //                 onTapUp: (details){
  //                    double dx = details.globalPosition.dx;
  //                   double dy = details.globalPosition.dy;
  //                   double dx2 = MediaQuery.of(context).size.width - dx;
  //                   double dy2 = MediaQuery.of(context).size.width - dy;

  //                   showMenu(context: context,
  //                   position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
  //                    items: [
  //                       PopupMenuItem(
  //                         onTap: () {
                          
  //                             Navigator.pushNamed(context, EditProduct.id,arguments: products[index]);
  //                           Navigator.of(context).pushNamed(SignUp.id);

  //                         },
  //                         child: Text("edit")),
  //                       PopupMenuItem(
  //                         onTap: (){
  //                           //Navigator.pushNamed(context, EditProduct.id);
  //                           //Navigator.of(context).pushNamed(SignUp.id);
                          
  //                          // _store.deleteProduct(products[index].pId);

  //                         },
  //                         child: Text("delete")),

  //                    ]
                      
                      
                      
  //                     );
  //                 },


  //                 child: