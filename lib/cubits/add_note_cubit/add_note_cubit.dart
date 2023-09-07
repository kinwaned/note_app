import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:todo_list_app/cubits/authentication_cubit/notes_cubit_authentication.dart';
import 'package:todo_list_app/main.dart';
import 'package:todo_list_app/model/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async{
    emit(AddNoteLoading());
    try{
      var notesBox = Hive.box<NoteModel>(kNoteBox);
      emit(AddNoteSuccess());
      await notesBox.add(note);
    }catch (e){
      emit(AddNoteFailure(e.toString()));
    }
  }
}
