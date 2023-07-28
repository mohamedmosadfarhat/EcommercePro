import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/card_item.dart';
import 'package:ecommerce/screens/developers.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/screens/navbar.dart';
import 'package:ecommerce/screens/about_app.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Carousel extends StatefulWidget {
   static String id="Carousel";

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
   var _bottombarindex=0;
  //final _store=Store();
  final _auth=Auth();
  @override
  Widget build(BuildContext context) {
       final h= MediaQuery.of(context).size.height;
       final w= MediaQuery.of(context).size.width;

    return Scaffold(
backgroundColor: Colors.grey[300],
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
        elevation: .1,
      
        backgroundColor: Colors.white,
     iconTheme: IconThemeData(color: basiccolor,size: 25),

        // title: Text("Categories",
        //       textAlign: TextAlign.center,
        //       style: TextStyle(fontSize: 40,color: Colors.white),),
      ),

      //
      body: ListView(
        children: [
Center(
            child: Container(
              width:w,
              height: h*.1,
              decoration: BoxDecoration(
                color: Colors.white,
               // borderRadius: BorderRadius.circular(20)
              ),
              child: Text("collections",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50,color: basiccolor),),
            ),
          )
         ,
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("images/jackets/jacket1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("images/jackets/t_shirt8.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("images/shoes/shoes14.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("images/trousers/trouser14.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider
              
            ],

            //Slider Container properties
            options: CarouselOptions(
              
              height: h*0.7,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 300),
              viewportFraction: 0.8,
              disableCenter: false
            ),
            
          ),
          Center(
            child: Container(
              width:w*.9,
              height: h*.08,
              decoration: BoxDecoration(
                color: basiccolor,
                borderRadius: BorderRadius.circular(20)
              ),
              child: InkWell(
                onTap: (){
                   Navigator.of(context).pushNamed(HomePage.id);
                },
                child: Text("Sell Now",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50,color: Colors.white),),
              ),
            ),
          )
        ],
      ),
    );
  }
}