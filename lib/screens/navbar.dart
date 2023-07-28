// import 'package:flutter/material.dart';

// class NavBar extends StatelessWidget {
//   const NavBar({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(

//       );

//   }
// }
import 'dart:io';

import 'package:ecommerce/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  _gotoPage(String route, BuildContext context) {
    Navigator.of(context).pushReplacementNamed(route);
  }
File? _image;
  
 var _url;
  void initState(){
    super.initState();
    getEmail();
  }
  String useremail="";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Drawer(
        child: ListView(
          children: [
            //

            //
            UserAccountsDrawerHeader(
              
              accountName: Text(""),
              accountEmail: Text(useremail,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                            

              currentAccountPicture: CircleAvatar(
                backgroundImage: _image == null ? null : FileImage(_image!),
                  radius: 200,
               ),
              decoration: BoxDecoration(
              color: basiccolor,
              // image: DecorationImage(
              //     image: AssetImage(
              //       "images/comic/kj.jpeg",
              //     ),
              //     fit: BoxFit.fill,
              //   ),
              //
              ),
              otherAccountsPictures: [
              
                GestureDetector(onTap: pickImage, child: Container(
                   
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(30)
                   ),
                  child: Icon(Icons.camera_alt))),
                GestureDetector(onTap: galleryImage, child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  )
                  ,
                  child: Icon(Icons.browse_gallery_rounded))),

                // Builder(
                //   builder: (context) => ElevatedButton(
                //     onPressed: () {
                //        uploadImage(context);
                //     },
                //     child: Text('Upload Image'),
                //   ),
                // ),
                //  Container(
                //    width: 17,
                //    child: ElevatedButton(
                    
                //     onPressed:galleryImage ,
                //     child: Text('Load Image'),
                //                  ),
                //  ),

              ],
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text("About"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.grid_3x3_outlined),
              title: Text("Products"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Contact"),
              onTap: () {},
            )
          ],
        ),
      );
  }

  void pickImage() async {
    //var image = await ImagePicker().pickImage(source: ImageSource.camera);

    final XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(image!=null) {
      setState(() {
        // _image = image as File? ;
        _image = File(image!.path);
      });
    }else{}
  }

  void galleryImage() async {
    //var image = await ImagePicker().pickImage(source: ImageSource.camera);
  final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
if(image!=null) {
      setState(() {
      // _image = image as File? ;
        _image = File(image!.path);
    });
    }else{}
    
  }

void uploadImage (context)async {
 try{
   FirebaseStorage storage = FirebaseStorage.instance;
Reference ref = storage.ref().child(_image!.path + DateTime.now().toString());
UploadTask uploadTask = ref.putFile(_image!);
uploadTask.then((res) {
  var url= res.ref.getDownloadURL();
   print('url $url');
setState(() {
     _url= url;
    });
    

       }  
);
 }  catch(e)
 {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please take photo")));

   print(e.toString());
 }
}

 getEmail() async {

    final  SharedPreferences pref=await SharedPreferences.getInstance();
    useremail= pref.getString("email") ??"__";
    setState(() {

    });


  }
}

