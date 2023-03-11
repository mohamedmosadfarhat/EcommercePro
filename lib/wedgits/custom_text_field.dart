import 'dart:ffi';

import 'package:buyit/constants.dart';
import 'package:flutter/material.dart';

class CstomTextField extends StatelessWidget {
  // const CstomTextField({
  //   super.key,
  // });
  final IconData icon;
  final String hint;
  var control;
  //final VoidCallback? onclik;
   //final ValueSetter onclik;
  //onclik(){}
  CstomTextField({ Key? key,  required this.hint,required this.icon, required this.control }): super(key: key);

 // const GeneralCustomButton({ Key? key, this.text, this.onTap, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
   
    return TextFormField(
    //onSaved: onclik,
      controller:control  ,        
      validator: (value){
        if(value!.isEmpty){
          return "value is empty";
        }
        return "farhat";
      },
      decoration: InputDecoration(
          hintText: hint,
          filled: true,
          prefixIcon: Icon(icon),
          fillColor: kSecondaryColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Colors.white

            ),

          )
      ),
    );
  }
}