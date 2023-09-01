// ignore_for_file: must_be_immutable

part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}
class NotesLoginLoading extends NotesState {}
class NotesLoginSuccess extends NotesState {}
class NotesLoginFailure extends NotesState {
  String errMessage;
  NotesLoginFailure({
    required this.errMessage,
});
}
class NotesRegisterLoading extends NotesState {}
class NotesRegisterSuccess extends NotesState {}
class NotesRegisterFailure extends NotesState {
  String errMessage;
  NotesRegisterFailure({
    required this.errMessage,
  });
}

