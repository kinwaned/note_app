// ignore_for_file: must_be_immutable





import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  MyText(
      {Key? key,
      required this.text,
      required this.fontWeight,
      required this.fontSize})
      : super(key: key);

  String text;
  double fontSize;
  FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class MySettingsButton extends StatefulWidget {
  MySettingsButton({
    Key? key,
    required this.function,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.myIcon,
  }) : super(key: key);

  VoidCallback? function;
  String text;
  double fontSize;
  FontWeight fontWeight;
  IconData? myIcon;

  @override
  State<MySettingsButton> createState() => _MySettingsButtonState();
}

class _MySettingsButtonState extends State<MySettingsButton> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: widget.function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(widget.myIcon, color: Colors.black,),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                      fontWeight: widget.fontWeight,
                      fontSize: widget.fontSize,
                      color: Colors.black),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.black,),

          ],
        ),
      ),
    );
  }

}
