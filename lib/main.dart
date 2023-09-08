import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/Screens/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_list_app/Screens/login_screen.dart';
import 'package:todo_list_app/Screens/register_screen.dart';
import 'package:todo_list_app/Screens/settings_screen.dart';
import 'package:todo_list_app/model/note_model.dart';
import 'package:todo_list_app/services/main_screen.dart';
import 'package:todo_list_app/simple_bloc_observer.dart';
import 'Screens/edit_note_view.dart';
import 'cubits/authentication_cubit/notes_cubit_authentication.dart';
import 'firebase_options.dart';

void main() async {

  Bloc.observer = SimpleBlockObserver();
  await Hive.initFlutter();
  await Hive.openBox(kNoteBox);
  Hive.registerAdapter(NoteModelAdapter());
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
          HomePage.id: (context) => const HomePage(),
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


const kNoteBox = 'note_box';
