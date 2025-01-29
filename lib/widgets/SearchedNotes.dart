import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/Cubits/Note/notes_cubit_cubit.dart';
import 'package:notesapp/Model/Note_Model.dart';
import 'package:notesapp/widgets/NoteWidget.dart';

class Searchednotes extends StatefulWidget {
  const Searchednotes({super.key, required this.notes});
  final List<NoteModel> notes;

  @override
  State<Searchednotes> createState() => _SearchednotesState();
}

class _SearchednotesState extends State<Searchednotes> {
  @override
  void initState() {
    super.initState();
    context.read<NotesCubitCubit>().FetchAllNotes();
  }

  Future<void> _refreshNotes() async {
    context.read<NotesCubitCubit>().FetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshNotes,
      child: ListView.builder(
        itemCount: widget.notes.length,
        itemBuilder: (context, index) {
          final note = widget.notes[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: NoteWidget(
              Note: note,
            ),
          );
        },
      ),
    );
  }
}