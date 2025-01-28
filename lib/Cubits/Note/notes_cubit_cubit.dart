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
      emit(NotesCubitInitial());
       notesBox =  Hive.box<NoteModel>(kNotesbox).values.toList();
       emit(NotesCubitFetched(notesBox));
       
    
}}
