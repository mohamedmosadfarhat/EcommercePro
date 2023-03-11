

import 'package:buyit/constants.dart';
import 'package:buyit/prvider/adminmode.dart';
import 'package:buyit/screens/add_product.dart';
import 'package:buyit/screens/admin.dart';
import 'package:buyit/screens/home_page.dart';
import 'package:buyit/screens/signup.dart';
import 'package:buyit/wedgits/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:buyit/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static String id = "loginscreen";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
final _auth=Auth();

bool isAdmin=false;

final adminpassword="admin1234";

 bool keepMeLoggedIn = false;

String? _email="jhg@gmail.com";

String? _password="12345678";

final _textController2 = TextEditingController();

final _textController3 = TextEditingController();

  // double h=MediaQuery.of(context).size.height;
final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(image: AssetImage("images/icons/buyicon.png")),
      
                    Positioned(
                        bottom: 0,
                        child: Text("Buy it", style: TextStyle(
                            fontFamily: "pacifico", fontSize: 20),)),
                  ],
                ),
              ),
            ),
      SizedBox(height: height*.1,),
      
            //==========
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: CstomTextField(
                control: _textController2,
                // onclik: (value){
                //  //value=name;
                // },
                hint:"Enter your email",icon:Icons.email),
            ),
           // SizedBox(height: height*.05,),
  Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Theme(
                      data: ThemeData(unselectedWidgetColor: Colors.white),
                      child: Checkbox(
                        checkColor: kSecondaryColor,
                        activeColor: kMainColor,
                        value: keepMeLoggedIn,
                        onChanged: (value) {
                          setState(() {
                            keepMeLoggedIn = value!;
                          });
                        },
                      ),
                    ),
                    Text(
                      'Remmeber Me ',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),




      //=======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: CstomTextField(
                control: _textController3,

                // onclik: (value){
                //  //value=name;
                // },
                
                hint:"Enter your password",icon:Icons.password),
            ),
            SizedBox(height: height*.04,),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Builder(
                builder: (context) {
                  return ElevatedButton(onPressed: ()async{
                    if(keepMeLoggedIn==true)
                    {
                      keepUserLoggedIn();
                    }

 try{
                               // _globalKey1.currentState?.save();
                               _email=_textController2.text;
                               _password=_textController3.text;

                               if(_password==adminpassword)
                               {
                                    Navigator.of(context).pushNamed(Admin.id);
                                     //Navigator.of(context).pushNamed(HomePage.id);

                               }
                               else{
                               final User =await _auth.SignIn(_email!, _password!);
                             //  print("ok");
                                     Navigator.of(context).pushNamed(HomePage.id);
                               }
                               }catch (e){
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${e.toString()}")));
                                
                                //  Scaffold.of(context).showBottomSheet((context) => Text(e.toString(),
                                //  style:TextStyle(fontSize: 20,color: Colors.amber) ,));

                               }
                              

                  },
      
                      child: Text("login")
      
                  );
                }
              ),
            ),
            SizedBox(height: height*.05,),
      
      
            Row(
              children: [
                Text("Donot have account ? ",style: TextStyle(fontSize: 20,color: Colors.black),),
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed(SignUp.id);
                    },
                    child: Text("Singn up ",style: TextStyle(fontSize: 22,color: Colors.blue),)),
              ],
            ),

            Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<AdminMode>(context, listen: false)
                              .changeIsAdmin(true);
                        },
                        child: Text(
                          'i\'m an admin',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Provider.of<AdminMode>(context).isAdmin
                                  ? kMainColor
                                  : Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<AdminMode>(context, listen: false)
                              .changeIsAdmin(false);
                        },
                        child: Text(
                          'i\'m a user',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color:
                                  Provider.of<AdminMode>(context, listen: true)
                                          .isAdmin
                                      ? Colors.white
                                      : kMainColor),
                        ),
                      ),
                    ),
                  ],
                ),
      
            //========
      
      
          ],
      
        ),
      ),
    );
  }
void keepUserLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(kKeepMeLoggedIn, keepMeLoggedIn);
  }

}

//  void _validate(BuildContext context) async {
//     //final modelhud = Provider.of<ModelHud>(context, listen: false);
//     //modelhud.changeisLoading(true);
//     if (widget.globalKey.currentState.validate()) {
//       widget.globalKey.currentState.save();
//       if (Provider.of<AdminMode>(context, listen: false).isAdmin) {
//         if (password == adminPassword) {
//           try {
//             await _auth.signIn(_email.trim(), password.trim());
//             Navigator.pushNamed(context, AdminHome.id);
//           } catch (e) {
//             modelhud.changeisLoading(false);
//             Scaffold.of(context).showSnackBar(SnackBar(
//               content: Text(e.message),
//             ));
//           }
//         } else {
//           modelhud.changeisLoading(false);
//           Scaffold.of(context).showSnackBar(SnackBar(
//             content: Text('Something went wrong !'),
//           ));
//         }
//       } else {
//         try {
//           await _auth.signIn(_email.trim(), password.trim());
//           Navigator.pushNamed(context, HomePage.id);
//         } catch (e) {
//           Scaffold.of(context).showSnackBar(SnackBar(
//             content: Text(e.message),
//           ));
//         }
//       }
//     }
//     modelhud.changeisLoading(false);
//   }

//   void keepUserLoggedIn() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.setBool(kKeepMeLoggedIn, keepMeLoggedIn);
//   }
// }