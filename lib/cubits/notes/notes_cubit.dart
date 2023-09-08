import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo_list_app/model/note_model.dart';

import '../../main.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  addNote(NoteModel note) {
    try{
      var notesBox = Hive.box<NoteModel>(kNoteBox);
      List<NoteModel> notes = notesBox.values.toList();
      emit(NotesSuccess(notes));
    }catch (e){
      emit(NotesFailure(e.toString()));
    }
  }
}
