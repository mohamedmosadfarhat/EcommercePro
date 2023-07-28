//import 'dart:html';



import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/services/store.dart';
import 'package:ecommerce/wedgits/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  //const EditProduct({ Key? key }) : super(key: key);
static String id="editproduct";
//final _store=Store();
 

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _store=Store();
  final _textController1 = TextEditingController();
final _textController2 = TextEditingController();
final _textController3 = TextEditingController();
final _textController4 = TextEditingController();
final _textController5 = TextEditingController();
  List _products=[];
  //var product = ModalRoute.of(context)!.settings.arguments;
  // Product? arguments = ModalRoute.of(context)!.settings.arguments;
//List<Product> product=ModalRoute.of(context).settings.arguments;
//final arguments = ModalRoute.of(context)!.settings.arguments;
 //final args = ModalRoute.of(context)!.settings.arguments as Product;
 // final _pr=Product();
  //    final Product args = ModalRoute.of(context).settings.arguments;

  @override
  Widget build(BuildContext context) {
  //final Product arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}); //as Map;
 // List<Product> product=ModalRoute.of(context).settings.arguments;
 Product prduct = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      backgroundColor: Colors.amber,
      body: ListView(
        
        children: [
          SizedBox(height: 100,),
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        CstomTextField(hint: "product name",icon:Icons.info, control: _textController1),
        SizedBox(height: 10,),
        CstomTextField(hint: "product price",icon:Icons.info, control: _textController2),
        SizedBox(height: 10,),
        CstomTextField(hint: "product description",icon:Icons.info, control: _textController3),
         SizedBox(height: 10,),
        CstomTextField(hint: "product category",icon:Icons.info, control: _textController4),
         SizedBox(height: 10,),
        CstomTextField(hint: "product location",icon:Icons.info, control: _textController5),
         SizedBox(height: 20,),
         // CstomTextField(hint: "product name",icon:Icons.info, control: _textController1)
        ElevatedButton(onPressed: (){
         String _productname=_textController1.text;
         String _productprice=_textController2.text;
         String _productdescription=_textController3.text;
         String _productdcategory=_textController4.text;
         String _productlocation=_textController5.text;
        // //=========
        
                try{
                 _store.editProduct({
                   kProductName:_productname ,
                   kProductPrice:_productprice ,
                   kProductDescription:_productdescription ,
                   kProductCategory:_productdcategory ,
                   kProductLocation:_productlocation ,
                  //print("ddddddddddddddddd");
      
      
                    
                  },prduct.pId);//product.uid from modelroute

      
                  print("dddddddddddddddddoooooooo");
             // }
                }catch(e)
                {
                  print(e);
                  print("ddddddddddddddddd");
                }
        
        
        
        
        //==========
        },
        style: ElevatedButton.styleFrom(  
             backgroundColor: Colors.green
                //  primary: Colors.deepOrangeAccent,
                  //onPrimary: Colors.black,
                ),
         child: Text("Edit product")),
          ],
        ),
      ), 

//========
        ],
      )
//     
        
      
    );
  }
 
}
  


