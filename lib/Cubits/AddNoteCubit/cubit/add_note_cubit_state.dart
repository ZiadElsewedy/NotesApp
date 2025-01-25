part of 'add_note_cubit_cubit.dart';

@immutable
sealed class AddNoteCubitState {}

 class AddNoteCubitInitial extends AddNoteCubitState {}
 class AddNoteCubitLoading extends AddNoteCubitState {}
 class AddNoteCubitFailer extends AddNoteCubitState {
    final String ErrorMessage;

  AddNoteCubitFailer({required this.ErrorMessage}); 
 }
 class AddNoteCubitSucsses extends AddNoteCubitState {}

