import 'package:flutter/material.dart';
import 'package:notesapp/constants/constants.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.Textname ,  this.onTap , this.isloading = false});
  final String Textname;
  final VoidCallback? onTap;
  final bool? isloading ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimarycolor,
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        height: 50,
        child: Center(
          child: isloading!
              ? SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.2,
                    strokeAlign: .01,
                  ),
                )
              : Text(
                  Textname,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
        ),
      ),
    );
  }
}