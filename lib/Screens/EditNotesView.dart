import 'package:flutter/material.dart';
import 'package:notesapp/widgets/customs/CustomAppBar.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});
static  String id = 'EditNoteView';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CustomAppbar(Appbartitle:' Edit Note',icon: Icons.done_all,ontap: (){},),
      ),
    );
  }
}