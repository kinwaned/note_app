import 'package:flutter/material.dart';
import 'package:todo_list_app/Screens/edit_note_view.dart';
import 'package:todo_list_app/components/my_text_field_note.dart';

import '../components/custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  EditNoteViewBody({super.key});

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: const CustomAppBar(title: 'Edite Note', icon: Icons.check, ),
          ),
          const SizedBox(height: 10,),
          Column(
            children: [
              MyTextFormFieldNote(controller: titleController, hintText: 'Title'),
              const SizedBox(height: 10,),
              MyTextFormFieldNote(controller: contentController, hintText: 'Content', maxLine: 5,),
            ],
          ),


        ],
      ),
    );
  }
}
