 import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/card_item.dart';
import 'package:ecommerce/screens/developers.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/screens/navbar.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutApp extends StatefulWidget {
   const AboutApp({ Key? key }) : super(key: key);
    static String id="AboutApp";

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
       var _bottombarindex=1;
       final auth=Auth();

   @override
   Widget build(BuildContext context) {
     return Scaffold(
          drawer: MyDrawer(), 

      appBar: AppBar(
        backgroundColor: basiccolor,
        centerTitle: true,
        
        title: const Text(
          'About App',
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
            if(value==2)
            {
             Navigator.popAndPushNamed(context,Developers.id);
            
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
     );
   }
}