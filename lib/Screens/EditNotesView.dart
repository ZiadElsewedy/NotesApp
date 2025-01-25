import 'package:flutter/material.dart';
import 'package:notesapp/customs/CustomAppBar.dart';
import 'package:notesapp/customs/CustomTextField.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});
static  String id = 'EditNoteView';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CustomAppbar(Appbartitle:' Edit Note',icon: Icons.done_all,ontap: (){},),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 7 , left: 7 , top: 10 , bottom: 5),
        child: Column(children: [
          SizedBox(height: 30,),
          Custom_Text_Field(hintText: 'Title', Text: 'Edit Title', icon: Icons.title , MaxLines: 2,Onchange: (context){},),
          SizedBox(height: 20,),
          Custom_Text_Field(hintText: 'Content', Text: 'Edit Content', icon: Icons.edit_note_rounded , MaxLines: 6,Onchange: (context){} ,)
        ],),
      ),
    );
  }
}