import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_app/Screens/HomeScreen.dart';
import 'package:todo_list_app/Screens/login_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static String id = 'MainPage';

  // so
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData) {
            return const HomePage();
          }else{
            return LoginPage();
          }
        },
      ),
    );
  }
}
