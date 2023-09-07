import 'package:flutter/material.dart';
import 'package:todo_list_app/components/my_text_field_note.dart';

import '../components/custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: CustomAppBar(title: 'Edite Note', icon: Icons.check, ),
          ),
          SizedBox(height: 10,),
          Column(
            children: [
              MyTextFormFieldNote( hintText: 'Title', maxLine: null,),
              SizedBox(height: 10,),
              MyTextFormFieldNote( hintText: 'Content', maxLine: 5,),
            ],
          ),


        ],
      ),
    );
  }
}
