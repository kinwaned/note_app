// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';

class MyTextFormFieldNote extends StatelessWidget {
  const MyTextFormFieldNote({Key? key, required this.hintText,@required this.maxLine, this.onSaved}) : super(key: key);

  final String hintText;
  final int? maxLine;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        onSaved: onSaved,
        validator: (value){
          if (value?.isEmpty ?? true){
            return ('Field is required');
          }
          return null;
        },
        maxLines: maxLine,
        decoration: InputDecoration(
            hintText:  hintText,
            suffixIconColor: Colors.grey[400],
            enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey.shade400
              ),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[500])
        ),
      ),
    );
  }
}
