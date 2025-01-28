import 'package:flutter/material.dart';
import 'package:notesapp/Cubits/Note/notes_cubit_cubit.dart';
import 'package:provider/provider.dart';
import 'package:notesapp/Model/Note_Model.dart';
import 'package:notesapp/customs/CustomAppBar.dart';
import 'package:notesapp/customs/CustomTextField.dart';
import 'package:notesapp/customs/customButton.dart';

class EditNoteView extends StatefulWidget {
 EditNoteView({super.key, required this.noteModel});
static  String id = 'EditNoteView';
 NoteModel noteModel;

  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;
  TextEditingController contentController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.noteModel.title);
    contentController = TextEditingController(text: widget.noteModel.subtitle);
  }
  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppbar(
          Appbartitle: 'Edit Note',
          icon: Icons.done_all,
          ontap: () {
            widget.noteModel.title = title ?? widget.noteModel.title;
            widget.noteModel.subtitle = content ?? widget.noteModel.subtitle;
            widget.noteModel.save();
            context.read<NotesCubitCubit>().FetchAllNotes();
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 7, left: 7, top: 10, bottom: 5),
        child: Column(
          children: [
            SizedBox(height: 30),
            Custom_Text_Field(
              hintText: 'Title',
              Text: 'Edit Title',
              icon: Icons.title,
              MaxLines: 2,
              controller: titleController,
              Onchange: (value) {
                title = value;
              },
            ),
            SizedBox(height: 20),
            Custom_Text_Field(
              hintText: 'Content',
              Text: 'Edit Content',
              icon: Icons.edit_note_rounded,
              MaxLines: 7,
              controller: contentController,
              Onchange: (value) {
                content = value;
              },
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomButton(
                Textname: 'Done',
                onTap: () {
                  widget.noteModel.title = title ?? widget.noteModel.title;
                  widget.noteModel.subtitle = content ?? widget.noteModel.subtitle;
                  widget.noteModel.save();
                  context.read<NotesCubitCubit>().FetchAllNotes();
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _EditNoteViewState extends State<EditNoteView> {
//   String? title,content;
//   TextEditingController  contentController = TextEditingController();
//   TextEditingController  titleController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: CustomAppbar(Appbartitle:' Edit Note',icon: Icons.done_all,
//         ontap: (){
          
//           widget.noteModel.title = title ?? widget.noteModel.title;
//           widget.noteModel.subtitle = content ?? widget.noteModel.subtitle;
//           widget.noteModel.save();
//           context.read<NotesCubitCubit>().FetchAllNotes();
//           Navigator.pop(context);
//         },),
//       ),
//       body: Padding(
//         padding: EdgeInsets.only(right: 7 , left: 7 , top: 10 , bottom: 5),
//         child: Column(children: [
//           SizedBox(height: 30,),
//           Custom_Text_Field(hintText: 'Title', Text: 'Edit Title', icon: Icons.title , MaxLines: 2,Onchange: (value){title = value; },),
//           SizedBox(height: 20,),
//           Custom_Text_Field(hintText: 'Content', Text: 'Edit Content', icon: Icons.edit_note_rounded , MaxLines: 7,Onchange: (value){content = value;} ,),
//           SizedBox(height:50,),
//           Padding(
//             padding: const EdgeInsets.only(left: 20 , right: 20),
//             child: CustomButton(Textname: 'Done', onTap: (){
//           widget.noteModel.title = title ?? widget.noteModel.title;
//           widget.noteModel.subtitle = content ?? widget.noteModel.subtitle;
//           widget.noteModel.save();
//           context.read<NotesCubitCubit>().FetchAllNotes();
//           Navigator.pop(context);
          
//             },)),
//         ],),
//       ),
//     );
//   }
// }