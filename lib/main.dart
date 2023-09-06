import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Screens/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_list_app/Screens/edit_note_view_body.dart';
import 'package:todo_list_app/Screens/login_screen.dart';
import 'package:todo_list_app/Screens/register_screen.dart';
import 'package:todo_list_app/Screens/settings_screen.dart';
import 'package:todo_list_app/cubits/cubit/notes_cubit.dart';
import 'package:todo_list_app/services/main_screen.dart';
import 'Screens/edit_note_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TodoList());
}

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        routes: {
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          HomePage.id: (context) => HomePage(),
          MainPage.id: (context) => const MainPage(),
          SettingsPage.id: (context) => const SettingsPage(),
          EditNoteView.id: (context) => const EditNoteView(),
        },
        initialRoute: MainPage.id,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
