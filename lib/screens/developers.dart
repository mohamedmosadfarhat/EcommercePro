import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/screens/navbar.dart';
import 'package:ecommerce/screens/about_app.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Developers extends StatefulWidget {
  const Developers({Key? key}) : super(key: key);
 static String id="Developers";

  @override
  State<Developers> createState() => _DevelopersState();
}

class _DevelopersState extends State<Developers> {
  var _bottombarindex=2;
  //final _store=Store();
final _auth=Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(), 
      appBar: AppBar(
        backgroundColor: basiccolor,
        centerTitle: true,
        
        title: const Text(
          'Developers',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
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
            
            } if(value==0)
            {
             Navigator.popAndPushNamed(context,HomePage.id);
            
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
            

      //
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          
          children:
          [
            
            Expanded(
                child: buildDeveloper(
                    image: "images/farahat.jpg",
                    name: "Mohamed Farrhat \n hh",
                    information: " Department CS \n Flutter developer \n "
                        "faculty of computers and information"),
             ),
            Expanded(
                child: buildDeveloper(
                    image: "images/zahraa.jpg",
                    name: "Zahraa Salem",
                    information:  " Department IT \n Flutter developer \n faculty of computers and information"),
             ),
            Expanded(
                child: buildDeveloper(
                    image: "images/maliks.jpg",
                    name: "Adam Abo Zaid",
                    information: " Department CS \n Flutter developer \n "
                        "faculty of computers and information"),
             ),
          ],
        ),
      ),
    );
  }
}


Widget buildDeveloper({
  required String image ,
  required String name ,
  required String information ,
})=> Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children:
  [
  Container(
    width: 120,
    height: 120,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
    ),

    child: Image(
      image: AssetImage(
        image,
      ),
      fit: BoxFit.cover,
    ),
  ),
  const SizedBox(
    width: 20,
  ),
  Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Text(
          maxLines: 1,
          overflow:TextOverflow.ellipsis,
          name,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10,),
        Expanded(
          child: Text(
           information,
            style: const TextStyle(
              fontSize: 15,
            ),
            maxLines: 3,
            overflow:TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  ),
],
);