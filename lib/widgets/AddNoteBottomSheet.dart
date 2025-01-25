import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/Cubits/AddNoteCubit/cubit/add_note_cubit_cubit.dart';
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
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteCubitLoading ? true : false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: const AddNoteForm(),
            ),
          );
        },
      ),
    );
  }
}
