import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/Cubits/Note/notes_cubit_cubit.dart';
import 'package:notesapp/Model/Note_Model.dart';
import 'package:notesapp/Screens/EditNotesView.dart';


class NoteWidget extends StatelessWidget {
 
 final NoteModel Note ;

  const NoteWidget({super.key, required this.Note, });

  @override
  Widget build(BuildContext context) {
    
    return  GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteView(noteModel: Note,)));},
      child: Container(
        padding: const EdgeInsets.only(top: 24 , bottom: 24 , left: 10 ,),
        decoration: BoxDecoration(
          color: Color(Note.color),
          borderRadius: BorderRadius.circular(16),
        
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(Note.title,style: TextStyle(fontSize: 28  , color: Colors.black ),),
              subtitle: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16 ,),
                    child:  Text(Note.subtitle,style: TextStyle(fontSize: 17 , color: Colors.black.withOpacity(0.4)  ),),
                  ),
                ],
              )
              ,
              trailing:  IconButton(onPressed: (){
                Note.delete();
                BlocProvider.of<NotesCubitCubit>(context).FetchAllNotes();
                   } , icon: Icon(Icons.delete , color: Colors.black,))
              ),
            
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(Note.date , style: TextStyle(color: Colors.black54 , fontWeight:  FontWeight.bold , fontSize: 15),),
            ) ,
          ],
          
        ) ,
      ),
    );
  }
}