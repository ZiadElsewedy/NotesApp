import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/Cubits/Note/notes_cubit_cubit.dart';
import 'package:notesapp/Model/Note_Model.dart';
import 'package:notesapp/Screens/AddNoteBottomSheet.dart';
import 'package:notesapp/customs/CustomAppBar.dart';
import 'package:notesapp/widgets/ListviewBuilder.dart';
import 'package:notesapp/widgets/SearchedNotes.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});
  static String id = 'NotesView';

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  TextEditingController searchController = TextEditingController();
  List<NoteModel> allNotes = [];
  List<NoteModel> filteredNotes = [];
  @override
  void initState() {
    super.initState();
    context.read<NotesCubitCubit>().FetchAllNotes();
    searchController.addListener(() {
      onSearchChanged(searchController.text);
    });
  }
void onSearchChanged(String query) {
    setState(() {
      filteredNotes = allNotes
          .where((note) => note.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
          print('Filtered Notes: $filteredNotes');
    });

  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesCubitCubit, NotesCubitState>(
      listener: (context, state) { // Listen to the state changes
        if (state is NotesCubitFetched) { 
          allNotes = state.notesBox; // Initialize allNotes with the fetched notes
          filteredNotes = allNotes; // Initialize filteredNotes with allNotes
        print('All Notes: $allNotes');
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                context: context,
                builder: (context) {
                  return AddNote();
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          elevation: 10,
          backgroundColor: Color.fromARGB(255, 95, 115, 130),
        ),
        appBar: CustomAppbar(
            Appbartitle: 'Notes',
            icon: Icons.delete_rounded,
            onSearchChanged: (query) => onSearchChanged(query),
            searchController: searchController,
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 7, left: 7, top: 10, bottom: 5),
          child:  filteredNotes.isNotEmpty || searchController.text.isNotEmpty
                ? Searchednotes(notes: filteredNotes)
                : NotesListView(Notes: allNotes),
        ),
      ),
    );
  }
}
