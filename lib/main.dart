import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/manage_product.dart';
import 'package:ecommerce/prvider/adminmode.dart';
import 'package:ecommerce/prvider/card_item.dart';
import 'package:ecommerce/screens/add_product.dart';
import 'package:ecommerce/screens/admin.dart';
import 'package:ecommerce/screens/carausel.dart';
import 'package:ecommerce/screens/card_item.dart';
import 'package:ecommerce/screens/developers.dart';
import 'package:ecommerce/screens/edit_product.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/screens/onboarding.dart';
import 'package:ecommerce/screens/about_app.dart';
import 'package:ecommerce/screens/order_details.dart';
import 'package:ecommerce/screens/order_screen.dart';
import 'package:ecommerce/screens/product_info.dart';
import 'package:ecommerce/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
bool isUserLoggedIn = false;
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          isUserLoggedIn = snapshot.data!.getBool(kKeepMeLoggedIn) ?? false;
return MultiProvider(
      
      providers: [
             ChangeNotifierProvider<AdminMode>(create: (context)=>AdminMode()),
              ChangeNotifierProvider<CartItem>(
                create: (context) => CartItem(),
              ),

      ],
      child: MaterialApp(
       // theme: ThemeData(backgroundColor: Colors.white),
         initialRoute: isUserLoggedIn ? Carousel.id : onBoarding.id,


       routes:{
        onBoarding.id:(context)=>onBoarding(),
        Developers.id:(context)=>Developers(),
        Carousel.id:(context)=>Carousel(),
              
          AboutApp.id:(context)=>AboutApp(),
          Login.id:(context)=>Login(),
         SignUp.id:(context)=>SignUp(),
         HomePage.id:(context)=>HomePage(),
         Admin.id:(context)=>Admin(),
         AddProduct.id:(context)=>AddProduct(),
         EditProduct.id:(context)=>EditProduct(),
         ManageProducts.id:(context)=>ManageProducts(),
        ProductInfo.id:(context)=>ProductInfo(),
        CardItemScreen.id:(context)=>CardItemScreen(),
        OrdersScreen.id:(context)=>OrdersScreen(),
        OrderDetails.id:(context)=>OrderDetails(),
    
       },
       debugShowCheckedModeBanner: false
       
      ),
    );
//============
        }
      },
    );
  }
}

