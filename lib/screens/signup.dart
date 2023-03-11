import 'package:buyit/constants.dart';
import 'package:buyit/prvider/modelHud.dart';
import 'package:buyit/screens/login.dart';
import 'package:buyit/services/auth.dart';
import 'package:buyit/wedgits/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  //const SignUp({Key? key}) : super(key: key);
static String id ="signup";
final GlobalKey<FormState> _globalKey1=GlobalKey<FormState>();
final _auth=Auth();
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();
  final _textController3 = TextEditingController();
// String? _email="jhg@gmail.com";
// String? _password="123456789";
// String? _email;
// String? _password;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context)=>ModelHud(),
      child: Scaffold(
        backgroundColor: kMainColor,
        body: ListView(
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
                 control:_textController1 ,
                // onclik: (value){
                //  //value=name;
                // },
                hint:"Enter your name",icon:Icons.person),
            ),
            SizedBox(height: height*.03,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: CstomTextField(
                 control:_textController2 ,
                // onclik: (value){
                //  value=_email;
                // },
                
                hint:"Enter your email",icon:Icons.email),
            ),
            SizedBox(height: height*.03,),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: CstomTextField(
                control:_textController3 ,
                // onclik: (value){
                  
                //  value=_password;
                // },
                
                hint:"Enter your password",icon:Icons.password),
            ),
            SizedBox(height: height*.03,),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Builder(
                builder: (context) {
                  return ElevatedButton(
                      onPressed: ()async{
                  //    final modelhud=Provider.of<ModelHud>(context);
                     // modelhud.changeisLoading(true);
                    // 
                        // if( _globalKey1.currentState!.validate())
                         //{
                           try{
                           //  _email=_textController1;
                          String _email=_textController2.text;
                          String _password=_textController3.text;
                            _globalKey1.currentState?.save();
                           final User =await _auth.SignUp(_email.trim(), _password.trim());
                           }catch (e){
                             print(e);
                             Scaffold.of(context).showBottomSheet((context) => Text(e.toString(),
                             style:TextStyle(fontSize: 20,color: Colors.amber) ,));
                               
                          
                             
                           }
                    // }
                      },
        
                      child: Text("Signup")
        
                  );
                }
              ),
            ),
            SizedBox(height: height*.05,),
        //  ElevatedButton(onPressed: (){
        
        
        //    print(_email);
        //    print(_password);
        //  }, child: Text("GFHd")),
        
            Row(
              children: [
               Text("Do have account ? ",style: TextStyle(fontSize: 20,color: Colors.black),),
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed(Login.id);
                    },
                    child: Text("Login ",style: TextStyle(fontSize: 22,color: Colors.blue),)),
              ],
            )
        
            //========
        
        
          ],
        
        ),
      ),
    );
  }
}
