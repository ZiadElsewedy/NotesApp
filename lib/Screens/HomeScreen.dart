import 'package:flutter/material.dart';
import 'package:notesapp/widgets/CustomAppBar.dart';
import 'package:notesapp/widgets/ListviewBuilder.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppbar()
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15 , left: 15 , top: 10 ),
        child: SizedBox(
          child: NotesListView()
          ),
      ),
    );
  }
}
