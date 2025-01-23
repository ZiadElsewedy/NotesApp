import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add your custom search action here
        print('Search icon tapped');
      },
      child: Container(
        width: 45, // Set the width for the icon container
        height: 45, // Set the height for the icon container
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
         
        ),
        
        child: Icon(
          Icons.search, 
          color: Colors.white70,
          size: 30, 
        ),
      ),
    );
  }
}
