import 'package:flutter/material.dart';
import 'package:notesapp/widgets/SearchIcon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 15,),
        Text(
          "Notes",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        Spacer(),
        SearchIcon(),
      ],
    );
  }
}