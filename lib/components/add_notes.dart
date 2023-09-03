import 'package:flutter/material.dart';
import 'package:todo_list_app/components/my_button.dart';
import 'package:todo_list_app/components/my_text_field_note.dart';

class AddNotes extends StatelessWidget {
   AddNotes({super.key});

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          MyTextFormFieldNote(controller: titleController, hintText: 'Title'),
          SizedBox(height: 10,),
          MyTextFormFieldNote(controller: contentController, hintText: 'Content'),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: MyButton(onTap: (){}, text: 'Add'),
          ),
          ],
      ),
    );
  }
}