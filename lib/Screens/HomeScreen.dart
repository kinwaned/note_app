// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app/Screens/notes_view_body.dart';
import 'package:todo_list_app/Screens/settings_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static String id = 'HomeScreen';

  String formattedDate =
      DateFormat('dd MMM, yyyy, EEEE').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notes',
                          style: TextStyle(
                              fontSize: 45, fontWeight: FontWeight.w700, fontFamily: 'assets/fonts/Poppins-SemiBold.ttf'),
                        ),
                        // const SizedBox(
                        //   height: 1,
                        // ),
                        // Text(
                        //   formattedDate,
                        //   style: const TextStyle(
                        //     fontSize: 13,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search,color: Colors.white,),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, SettingsPage.id);
                            },
                            icon: const Icon(Icons.settings ,color: Colors.white,),
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
                const NoteViewBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
