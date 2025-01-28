import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
const SearchIcon({super.key, required this.icon, required this.onPress});
final IconData icon; 
final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 45, // Set the width for the icon container
        height: 45, // Set the height for the icon container
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
         
        ),
        
        child: IconButton(
          onPressed: onPress,
          icon: Icon(
            icon, 
          color: Colors.white70,
          size: 30, 
        ),
      ),
    );
  }
}
