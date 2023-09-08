import 'package:flutter/material.dart';

import 'my_button.dart';
import 'my_text_field_note.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });



  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          MyTextFormFieldNote(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextFormFieldNote(
            hintText: 'Content',
            maxLine: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const  SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: MyButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'Add'),
          ),
        ],
      ),
    );
  }
}
