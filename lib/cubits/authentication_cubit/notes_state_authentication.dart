// ignore_for_file: must_be_immutable

part of 'notes_cubit_authentication.dart';

@immutable
abstract class AuthNotesState {}

class NotesInitial extends AuthNotesState {}
class NotesLoginLoading extends AuthNotesState {}
class NotesLoginSuccess extends AuthNotesState {}
class NotesLoginFailure extends AuthNotesState {
  String errMessage;
  NotesLoginFailure({
    required this.errMessage,
});
}
class NotesRegisterLoading extends AuthNotesState {}
class NotesRegisterSuccess extends AuthNotesState {}
class NotesRegisterFailure extends AuthNotesState {
  String errMessage;
  NotesRegisterFailure({
    required this.errMessage,
  });
}

