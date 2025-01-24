import 'package:flutter/material.dart';
import 'package:notesapp/widgets/CustomAppBar.dart';
import 'package:notesapp/widgets/ListviewBuilder.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){} , child: Icon(Icons.add , color: Colors.white,), elevation: 10 , backgroundColor: Color.fromARGB(255, 95, 115, 130),),
      appBar: AppBar(
        title: CustomAppbar()
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 7 , left: 7 , top: 10 ),
        child: SizedBox(
          child: NotesListView()
          ),
          
      ),
    );
  }
}
