import 'package:flutter/material.dart';
import 'package:notesapp/widgets/customs/CustomTextField.dart';
import 'package:notesapp/widgets/customs/customButton.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Center(child: Text('Create Note' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 22),)),
            SizedBox(
              height: 30,
            ),
            Custom_Text_Field(hintText: 'Add title', Text: 'Title', icon: Icons.text_format,color: const Color.fromARGB(255, 193, 193, 193), MaxLines: 1,),
            SizedBox(height: 25,),
            Custom_Text_Field(hintText: 'Content', Text: 'Add content', icon: Icons.content_paste_go_sharp,color: const Color.fromARGB(255, 193, 193, 193), MaxLines: 6,),
            SizedBox(height: 20,),
            CustomButton(Textname: "Add" , onTap: (){}) 
        
          ],
        ),
      ),
    );
  }
}