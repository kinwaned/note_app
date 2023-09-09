import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/note_model.dart';
import '../view/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.notes});


  final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
         Navigator.pushNamed(context, EditNoteView.id);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
            color:  Colors.amber, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                notes.title,
                style:const TextStyle(fontSize: 26, color: Colors.black),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(notes.subTitle,style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.4)),),
              ),
              trailing: IconButton(onPressed: (){},icon:const Icon(FontAwesomeIcons.trash, color: Colors.black, size: 24,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(notes.date,style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.4)),),
            ),
          ],
        ),
      ),
    );
  }
}