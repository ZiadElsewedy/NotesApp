import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/Cubits/Note/notes_cubit_cubit.dart';
import 'package:notesapp/SomeFeatures/showOverlay.dart';
import 'package:provider/provider.dart';
import 'package:notesapp/Model/Note_Model.dart';
import 'package:notesapp/customs/CustomAppBar.dart';
import 'package:notesapp/customs/CustomTextField.dart';
import 'package:notesapp/customs/customButton.dart';

class EditNoteView extends StatefulWidget {
 EditNoteView({super.key, required this.noteModel});
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
            
            showOverlay(context, 'Note edited successfully!' );
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
            SizedBox(height: 20),
            ColorListView(noteModel: widget.noteModel,),
            SizedBox(height: 40),
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
                 showOverlay(context, 'Note edited successfully!');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ColorItem extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorItem({
    super.key,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle tap to toggle selection
      child: CircleAvatar(
        radius: 20,
        backgroundColor: color,
        child: isSelected
            ? const Icon(
                Icons.check,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 27,
              )
            : null, // Show check icon if selected
      ),
    );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key, required this.noteModel});
final NoteModel noteModel;
  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int selectedIndex = -1; // Tracks the selected color index

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: Colors.primaries.length, // Use available primary colors
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final color = Colors.primaries[index];
          final isSelected = index == selectedIndex;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ColorItem(
              color: color,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  selectedIndex = index; // Update selected index
                  widget.noteModel.color = color.value; // Update note color
                      
                    
                });
              },
            ),
          );
        },
      ),
    );
  }
}
