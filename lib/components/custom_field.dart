import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  CustomField({super.key});
  Color kPrimaryColor = const Color(0xff62FCD7);
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: 'Title',
        hintStyle: TextStyle(
          color: kPrimaryColor
        ),
        border: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(kPrimaryColor),
        enabledBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:  BorderSide(color: color ?? Colors.black),
    );
  }
}
