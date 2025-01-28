import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/Cubits/AddNoteCubit/cubit/add_note_cubit_cubit.dart';
import 'package:notesapp/Cubits/Note/notes_cubit_cubit.dart';
import 'package:notesapp/SomeFeatures/showOverlay.dart';
import 'package:notesapp/widgets/ANForm.dart';

class AddNote extends StatelessWidget {
   AddNote({super.key});
  @override

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubitCubit(),
      
      child: BlocConsumer<AddNoteCubitCubit, AddNoteCubitState>(
        listener: (context, state) {
          if (state is AddNoteCubitFailer) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.ErrorMessage),
            ));
          }
          if (state is AddNoteCubitSucsses) {
           showOverlay(context, 'Note added successfully!');
                
            
            BlocProvider.of<NotesCubitCubit>(context).FetchAllNotes();
            Navigator.pop(context);
            
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteCubitLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(right: 16, left: 16, top: 16,
               bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddNoteForm(),
            ),
          );
        },
      ),
    );
  }
}
