import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/Model/Note_Model.dart';
import 'package:notesapp/constants/constants.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
    List<NoteModel> notesBox = [];
   FetchAllNotes()  {
    print('Fetching all notes...'); // Debug log
      var box =  Hive.box<NoteModel>(kNotesbox);
       notesBox = box.values.toList();
       
        print('Notes fetched: ${notesBox.length}'); // Debug log
       emit(NotesCubitFetched(notesBox));
       
    
}}
