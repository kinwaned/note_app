import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/cubits/notes/notes_cubit.dart';
import 'package:todo_list_app/model/note_model.dart';

import '../components/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return  Padding(
                  padding:const EdgeInsets.symmetric(vertical: 4),
                  child: NoteItem(notes: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
