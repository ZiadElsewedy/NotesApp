import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/Model/Note_Model.dart';
import 'package:notesapp/constants/constants.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubitCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubitCubit() : super(AddNoteCubitInitial());
  AddNote(NoteModel Note) async{
  emit( AddNoteCubitLoading());
  try {
  var NotesBox = Hive.box<NoteModel>(kNotesbox);  //the box that we will store the data as NoteModel
  await NotesBox.add(Note);
  emit( AddNoteCubitSucsses());
} catch (e) {
  emit(AddNoteCubitFailer(ErrorMessage: e.toString()));
  
}
  }
}
