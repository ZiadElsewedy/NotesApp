import 'package:flutter/material.dart';
import 'package:notesapp/Model/Note_Model.dart';
import 'package:notesapp/widgets/NoteWidget.dart';

class Searchednotes extends StatelessWidget {
  const Searchednotes({super.key, required this.notes});
  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: NoteWidget(Note: note),
        );
      },
    );
  }
}