import 'package:flutter/material.dart';

import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(itemBuilder: (context, index){
        return const Padding(
          padding:  EdgeInsets.symmetric(vertical: 4),
          child:  NoteItem(),
        );
      }),
    ) ;
  }
}