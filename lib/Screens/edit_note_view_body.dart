import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/components/my_text_field_note.dart';
import 'package:todo_list_app/cubits/notes/notes_cubit.dart';
import 'package:todo_list_app/model/note_model.dart';

import '../components/ColorListView.dart';
import '../components/custom_app_bar.dart';
import '../components/edit_color_list.dart';
import '../constants.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomAppBar(
              title: 'Edite Note',
              icon: Icons.check,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              MyTextFormFieldNote(
                onChanged: (value){
                  title =  value;
                },
                hintText: widget.note.title,
                maxLine: null,
              ),
              SizedBox(
                height: 10,
              ),
              MyTextFormFieldNote(
                onChanged: (value){
                  content =  value;
                },
                hintText:widget.note.subTitle,
                maxLine: 5,
              ),
              EditColorList(note: widget.note),
            ],
          ),
        ],
      ),
    );
  }
}


