import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/Cubits/AddNoteCubit/cubit/add_note_cubit_cubit.dart';
import 'package:notesapp/Model/Note_Model.dart';
import 'package:notesapp/Screens/EditNotesView.dart';
import 'package:notesapp/Screens/HomeScreen.dart';
import 'package:notesapp/constants/constants.dart';
import 'package:notesapp/simple_bloc_observer/Simple_Bloc.dart';

void main() async{
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
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
