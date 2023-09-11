import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});

  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ?  CircleAvatar(
            backgroundColor: color,
            radius: 16,
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ))
        :  CircleAvatar(
            backgroundColor: color,
            radius: 16,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;

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
                      setState(() {});
                      BlocProvider.of<AddNoteCubit>(context).color = kColor[index];
                    },
                    child: ColorItem(isSelected: currentIndex == index, color: kColor[index])),
              );
            }),
      ),
    );
  }
}
