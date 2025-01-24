import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notesapp/constants/constants.dart';

class Custom_Text_Field extends StatelessWidget {
  final String hintText;
  final String Text;
  final IconData icon;
  final Color? color;
  final bool Secure;
  final TextInputType? Datatype;
  final Function(String)? Onchange;
  final int MaxLines ;

  Custom_Text_Field({super.key, this.Secure = false , required this.hintText, required this.Text, required this.icon ,this.Onchange,  this.color , this.Datatype,  this.MaxLines = 1});
  
 
   
  @override
  Widget build(BuildContext context) {
    
    return  TextFormField(
      maxLines: MaxLines,
      selectionHeightStyle: BoxHeightStyle.includeLineSpacingTop,
      obscureText: Secure ,
      keyboardType: Datatype,
      // validator: (data){
      //   if (data!.isEmpty) {
      //     return 'Field is required ';
      //   }
      // } ,
        onChanged: Onchange,
        decoration: InputDecoration(
          
          hintText: hintText,
          labelText: Text,
          labelStyle: TextStyle(color: color),
          hintStyle: TextStyle(color: color),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color!),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimarycolor),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.blue.withOpacity(0.1),
          prefixIcon: Icon(icon, color: color),
        ),
        style: TextStyle(color : color ),
      );
    
  }
}
