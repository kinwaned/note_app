
import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/note_model.dart';
import 'ColorListView.dart';

class EditColorList extends StatefulWidget {
  const EditColorList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditColorList> createState() => _EditColorListState();
}

class _EditColorListState extends State<EditColorList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColor.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 10, top: 10),
      child: SizedBox(
        height: 16 * 2,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: kColor.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: GestureDetector(
                    onTap: () {
                      currentIndex = index;
                      widget.note.color = kColor[index].value;
                      setState(() {});
                    },
                    child: ColorItem(isSelected: currentIndex == index, color: kColor[index])),
              );
            }),
      ),
    );
  }
}