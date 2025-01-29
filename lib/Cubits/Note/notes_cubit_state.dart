part of 'notes_cubit_cubit.dart';

@immutable
sealed class NotesCubitState {
  get note => null;
}

final class NotesCubitInitial extends NotesCubitState {}

final class NotesCubitFetched extends NotesCubitState {
  final List<NoteModel> notesBox;

  NotesCubitFetched(this.notesBox);
  
}
final class NotesCubitSearch extends NotesCubitState {}
