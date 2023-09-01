import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
      decoration: BoxDecoration(
          color: const Color(0xffFFCC80), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title:const Text(
              'Flutter tips',
              style: TextStyle(fontSize: 26, color: Colors.black),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Build your career with Kinwayned',style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.4)),),
            ),
            trailing: IconButton(onPressed: (){},icon:const Icon(FontAwesomeIcons.trash, color: Colors.black, size: 24,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text('Sep, 11,2023',style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.4)),),
          ),
        ],
      ),
    );
  }
}