// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_list_app/components/add_notes.dart';
import 'package:todo_list_app/components/custom_app_bar.dart';
import 'package:todo_list_app/Screens/notes_item_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
              context: context,
              builder: (context) {
                return AddNotes();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20,),
          child: Column(
            children: [
              CustomAppBar(title: 'Notes', icon: Icons.search,),
              Expanded(child: NotesListView()),
            ],
          ),
        ),
      ),
    );
  }
}
