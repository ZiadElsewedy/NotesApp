import 'package:flutter/material.dart';
import 'package:notesapp/widgets/SearchIcon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.Appbartitle, required this.icon, required this.ontap, });
final String Appbartitle ; 
final IconData icon ; 
final Function ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(width: 15,),
        Text(
          Appbartitle ,
          style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        const Spacer(),
        SearchIcon(icon:icon,ontap:ontap ,),
      ],
    );
  }
}