import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/Cubits/Note/notes_cubit_cubit.dart';
import 'package:notesapp/Model/Note_Model.dart';
import 'package:notesapp/Screens/HomeScreen.dart';
import 'package:notesapp/constants/constants.dart';
import 'package:notesapp/simple_bloc_observer/Simple_Bloc.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesbox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubitCubit(),
        child: MaterialApp(
          initialRoute: NotesView.id,
          theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
          debugShowCheckedModeBanner: false,
          home: const NotesView(),
        ),
      
    );
  }
}
