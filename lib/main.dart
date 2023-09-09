import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:todo_list_app/cubits/notes/notes_cubit.dart';
import 'package:todo_list_app/view/notes_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_list_app/Screens/login_screen.dart';
import 'package:todo_list_app/Screens/register_screen.dart';
import 'package:todo_list_app/Screens/settings_screen.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/model/note_model.dart';
import 'package:todo_list_app/services/main_screen.dart';
import 'package:todo_list_app/simple_bloc_observer.dart';
import 'view/edit_note_view.dart';
import 'cubits/authentication_cubit/notes_cubit_authentication.dart';
import 'firebase_options.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlockObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotesCubit>(create: (context) => NotesCubit()),
        BlocProvider<AuthNotesCubit>(create: (context) => AuthNotesCubit()),
        BlocProvider<AddNoteCubit>(create: (context) => AddNoteCubit()),
      ],
      child: MaterialApp(
        routes: {
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          NotesView.id: (context) => const NotesView(),
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

