

import 'package:ecommerce/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth{
final _auth=FirebaseAuth.instance;
// ignore: non_constant_identifier_names
// Future <UserCredential> SignUP(String email,String password)async{
//  UserCredential userCredential =await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     email: email, password: password);
// }
Future<UserCredential> SignUp(String email,String password)async
{
 final _authresult=await _auth.createUserWithEmailAndPassword(email: email, password: password);
 return _authresult;
}




Future<UserCredential> SignIn(String email,String password)async
{
 final _authresult=await _auth.signInWithEmailAndPassword(email: email, password: password);
 return _authresult;
}
Future<void> signOut() async {
    await _auth.signOut();
  }


}