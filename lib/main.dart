import 'package:buyit/constants.dart';
import 'package:buyit/models/manage_product.dart';
import 'package:buyit/prvider/adminmode.dart';
import 'package:buyit/prvider/card_item.dart';
import 'package:buyit/screens/add_product.dart';
import 'package:buyit/screens/admin.dart';
import 'package:buyit/screens/card_item.dart';
import 'package:buyit/screens/edit_product.dart';
import 'package:buyit/screens/home_page.dart';
import 'package:buyit/screens/login.dart';
import 'package:buyit/screens/order_details.dart';
import 'package:buyit/screens/order_screen.dart';
import 'package:buyit/screens/product_info.dart';
import 'package:buyit/screens/signup.dart';
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
                child: Text('Loading....'),
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
        initialRoute: isUserLoggedIn ? HomePage.id : Login.id,
       routes:{
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

   );