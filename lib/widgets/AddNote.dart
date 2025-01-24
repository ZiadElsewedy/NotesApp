import 'package:flutter/material.dart';
import 'package:notesapp/widgets/customTF/CustomTextField.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Center(child: Text('Create Note' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 22),)),
          SizedBox(
            height: 32,
          ),
          Custom_Text_Field(hintText: 'Add title', Text: 'Title', icon: Icons.text_format,color: const Color.fromARGB(255, 193, 193, 193),)
        ],
      ),
    );
  }
}