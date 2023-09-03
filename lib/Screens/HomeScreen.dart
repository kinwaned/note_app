// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_list_app/components/custom_app_bar.dart';
import 'package:todo_list_app/components/notes_item_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
      body:const SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomAppBar(),
              Expanded(child: NotesListView()),
            ],
          ),
        ),
      ),
    );
  }
}
