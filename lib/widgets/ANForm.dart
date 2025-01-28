import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/Cubits/AddNoteCubit/cubit/add_note_cubit_cubit.dart';
import 'package:notesapp/Model/Note_Model.dart';
import 'package:notesapp/SomeFeatures/Colors.dart';
import 'package:notesapp/customs/CustomTextField.dart';
import 'package:notesapp/customs/customButton.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? TitleNote , Content;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              'Create Note',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            )),
            const SizedBox(
              height: 30,
            ),
            Custom_Text_Field(
              hintText: 'Add title',
              Text: 'Title',
              icon: Icons.text_format,
              color: const Color.fromARGB(255, 193, 193, 193),
              MaxLines: 1,
              OnSaved: (value) {
                TitleNote = value;
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Custom_Text_Field(
                hintText: 'Content',
                Text: 'Add content',
                icon: Icons.content_paste_go_sharp,
                color: const Color.fromARGB(255, 193, 193, 193),
                MaxLines: 6,
                OnSaved: (value) {
                  Content = value;
                }),
            const SizedBox(
              height: 20,
            ),
            ColorListView(),
            SizedBox(
              height: 20,
            ),
            AddnoteLogic(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  BlocBuilder<AddNoteCubitCubit, AddNoteCubitState> AddnoteLogic() {
    return BlocBuilder<AddNoteCubitCubit, AddNoteCubitState>(
            builder: (context, state) {
              return CustomButton(
                  isloading:state is  AddNoteCubitLoading ? true : false,
                  Textname: "Add Note",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      NoteModel note = NoteModel(
                          color: Colors.blue.value,
                          title: TitleNote!,
                          subtitle: Content!,
                          date: getCurrentFormattedDateTime());
                      BlocProvider.of<AddNoteCubitCubit>(context).AddNote(note);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  });
            },
          );
  }
}
