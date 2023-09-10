import 'package:flutter/material.dart';
import 'package:todo_list_app/Screens/edit_note_view_body.dart';
import 'package:todo_list_app/model/note_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  static String id = 'EditNoteView';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EditNoteViewBody(note: note,),
    );
  }
}
