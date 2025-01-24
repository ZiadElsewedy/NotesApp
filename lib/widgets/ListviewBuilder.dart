import 'package:flutter/material.dart';
import 'package:notesapp/widgets/NoteWidget.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: NoteWidegt(Title: 'Flutter Project', Subtitle: 'pass and emails' , date: 'may , 2025'),
        );
      }
    );
  }
}