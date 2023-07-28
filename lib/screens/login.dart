

import 'package:ecommerce/constants.dart';
// import 'package:ecommerce/prvider/adminmode.dart';
// import 'package:ecommerce/screens/add_product.dart';
import 'package:ecommerce/screens/admin.dart';
import 'package:ecommerce/screens/carausel.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/signup.dart';
//import 'package:ecommerce/wedgits/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:flutter/services.dart';
//import 'package:get/state_manager.dart';
//import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';




class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
static String id = "loginscreen";
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPassword = true;
final _auth=Auth();

bool isAdmin=false;
String? _email="";

String? _password="";


final adminpassword="admin1234";

 bool keepMeLoggedIn = false;
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xfffed8c3),
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.35,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height *0.65,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0)
                      ),
                      color: Color(0xfffee8dc)
                  ),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        ClipOval(
                          child: Image(
                              height: 200.0,
                              width: 200.0,
                              fit: BoxFit.cover,
                              image: AssetImage('images/jackets/login.png')),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email address must not be empty";
                            }
                            return null;
                          },
                          cursorColor: Color(0xfffed8c3),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Color(0xffDA4C2D),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffDA4C2D)),),
                            labelText: 'Email Address',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email_outlined, color: Color(0xffDA4C2D)),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: emailController,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password must not be empty";
                              }
                              return null;
                            },
                            cursorColor: Color(0xfffed8c3),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: isPassword,
                            controller: passwordController,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                color: Color(0xffDA4C2D),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffDA4C2D)),),
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock_open, color: Color(0xffDA4C2D)),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPassword = !isPassword;
                                    });
                                  },
                                  icon: Icon(
                                    isPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ), color: Color(0xffDA4C2D)),
                            )),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color(0xfffc7c48)),
                          child: MaterialButton(
                              onPressed: () async{
                              
                                formKey.currentState!.validate();
                                    if(keepMeLoggedIn==true)
                    {
                      keepUserLoggedIn();
                    }

 try{
                               // _globalKey1.currentState?.save();
                               _email=emailController.text;
                               _password=passwordController.text;

                               if(_password==adminpassword)
                               {
                                    Navigator.of(context).pushReplacementNamed(Admin.id);
                                    

                               }
                               else{
                               final User =await _auth.SignIn(_email!, _password!);
                             //  print("ok");
                                     Navigator.of(context).pushNamed(Carousel.id);
                               saveemail(emailController.text);

                               }
                               } on FirebaseException catch (e){
                                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));


 }
                                //
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 20.0, color: Colors.black),
                              )),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don\'t have an account?"),
                            SizedBox(width: 5,),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                },
                                child: Text("Sign up", style: TextStyle(color: Color(0xffDA4C2D)),))
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
  void keepUserLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(kKeepMeLoggedIn, keepMeLoggedIn);
  }
saveemail(String email) async {
  final  SharedPreferences pref=await SharedPreferences.getInstance();
  pref.setString("email", email);


}
}