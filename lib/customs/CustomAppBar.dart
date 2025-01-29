import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  CustomAppbar({super.key, required this.Appbartitle, required this.icon,   this.searchController,  this.onSearchChanged,  this.onTap , });
final String Appbartitle ; 
final IconData icon ; 
final VoidCallback? onTap;
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Sreach Notes ....',  
            labelText: "Search",
            labelStyle: TextStyle(fontSize: 20),
            hintStyle: const TextStyle(color: Colors.white),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold),
          onChanged: onSearchChanged,
        ),
    
      ),
      actions: [ 
        IconButton(
          icon: Icon(icon),
          onPressed:(){
          searchController?.clear();
           onSearchChanged!(''); // Reset search
          }
        ),
      ],
    );
  }
}