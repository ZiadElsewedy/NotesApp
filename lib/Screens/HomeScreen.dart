import 'package:flutter/material.dart';
import 'package:notesapp/widgets/AddNote.dart';
import 'package:notesapp/customs/CustomAppBar.dart';
import 'package:notesapp/widgets/ListviewBuilder.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  static  String id = 'NotesView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          context: context, builder: (context){
          return const AddNote();
        });
      } ,
      child: Icon(Icons.add , color: Colors.white,), elevation: 10 , backgroundColor: Color.fromARGB(255, 95, 115, 130),),

      appBar: AppBar(
        title: CustomAppbar(Appbartitle: "Notes",icon: Icons.search,ontap: (){},)
      ),
      body: const Padding(
        padding: EdgeInsets.only(right: 7 , left: 7 , top: 10 , bottom: 5),
        child: SizedBox(
          child: NotesListView()
          ),
          
      ),
    );
  }
}
