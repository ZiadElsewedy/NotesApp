import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/Cubits/Note/notes_cubit_cubit.dart';
import 'package:notesapp/Model/Note_Model.dart';
import 'package:notesapp/widgets/NoteWidget.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
     void initState() {
    super.initState();
    context.read<NotesCubitCubit>().FetchAllNotes();
     }
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubitCubit, NotesCubitState>(
      builder: (context, state) {
        if (state is NotesCubitFetched) {
          List<NoteModel> notes = state.notesBox;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: NoteWidget(
                  Note: note,
                ),
              );
            },
          );
        } else if (state is NotesCubitInitial) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('No notes available.'));
        }
      },
    );
  }
}
