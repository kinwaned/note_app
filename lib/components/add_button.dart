// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AddMyButton extends StatelessWidget {
  const AddMyButton({
    Key? key,
    required this.onTap,
    this.isLoading = false,
  }) : super(key: key);
  final void Function()? onTap;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
            height: 24,
                width: 24,
                child: CircularProgressIndicator(
            color: Colors.white,
          ),
              )
              : const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
