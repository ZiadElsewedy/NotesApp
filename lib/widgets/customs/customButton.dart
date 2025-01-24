import 'package:flutter/material.dart';
import 'package:notesapp/constants/constants.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.Textname ,  this.onTap});
final String Textname;
VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap ,
      child: Container(
                decoration: BoxDecoration(
                  color: kPrimarycolor,
                  borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                height: 50,
                child: Center(child: Text(Textname,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white70),)) ,
              ),
    );
  }
}