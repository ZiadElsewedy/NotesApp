import 'package:flutter/material.dart';
import 'package:notesapp/Screens/HomeScreen.dart';

void main() {
  runApp(const NotesApp());
}
class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness : Brightness.dark ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
