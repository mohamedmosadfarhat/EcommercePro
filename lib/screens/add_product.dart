import 'package:buyit/models/product.dart';
import 'package:buyit/services/store.dart';
import 'package:buyit/wedgits/custom_text_field.dart';
import 'package:flutter/material.dart';
class AddProduct extends StatelessWidget {
 // const AddProduct({ Key? key }) : super(key: key);
 final store=Store();
 static String id = "addproduct";
final _textController1 = TextEditingController();
final _textController2 = TextEditingController();
final _textController3 = TextEditingController();
final _textController4 = TextEditingController();
final _textController5 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
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
          //=========
          //  if (_globalKey.currentState.validate()) {
          //           _globalKey.currentState.save();
      
                  //  Store.addProduct(Product(
                    try{
                    store.addproduct(Product(
                        pName: _productname,
                        pPrice: _productprice,
                        pDescription: _productdescription,
                        pLocation: _productlocation,
                        pCategory: _productdcategory));
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
           child: Text("Add product")),
              ],
            ),
          ),
        ),
      ),
//     
        
      
    );
  }
}






// request.auth != null