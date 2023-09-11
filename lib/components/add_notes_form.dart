import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/components/add_button.dart';
import 'package:todo_list_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:todo_list_app/model/note_model.dart';
import 'package:intl/intl.dart';
import 'ColorListView.dart';
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
            maxLine: null,
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
          // const SizedBox(
          //   height: 60,
          // ),
          const ColorListView(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return AddMyButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var currentDate = DateTime.now();
                      var formattedDate =
                          DateFormat('EE-dd-mm-yyyy').format(currentDate);
                      var notesModel = NoteModel(
                          color: Colors.white.value,
                          date: formattedDate,
                          subTitle: subTitle!,
                          title: title!);
                      BlocProvider.of<AddNoteCubit>(context)
                          .addNote(notesModel);
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


