import 'package:flutter/material.dart';
import 'package:notesapp/Screens/EditNotesView.dart';
import 'package:notesapp/Screens/HomeScreen.dart';

void main() {
  runApp(const NotesApp());
}
class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        EditNoteView.id : (context)=> const EditNoteView() ,
      },
      initialRoute: NotesView.id,
      theme: ThemeData(brightness : Brightness.dark, fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: const NotesView(),
    );
  }
}
