import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/cubits/add_note_cubit/add_note_cubit.dart';
import '../cubits/notes/notes_cubit.dart';
import 'add_notes_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {}

        if (state is AddNoteSuccess) {
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNoteLoading ? true : false,
          child:  Padding(
            padding: EdgeInsets.only(
                top: 30, bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const SingleChildScrollView(
              child: AddNoteForm(),
            ),
          ),
        );
      },
    );
  }
}
