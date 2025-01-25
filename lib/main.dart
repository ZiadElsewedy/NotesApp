import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/Screens/EditNotesView.dart';
import 'package:notesapp/Screens/HomeScreen.dart';
import 'package:notesapp/constants/constants.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox(kNotesbox);
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
