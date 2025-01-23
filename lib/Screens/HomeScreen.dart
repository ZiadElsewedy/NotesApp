import 'package:flutter/material.dart';
import 'package:notesapp/widgets/CustomAppBar.dart';
import 'package:notesapp/widgets/NoteWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppbar()
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            NoteWidegt()
          ],
        ),
      ),
    );
  }
}
