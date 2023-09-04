// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list_app/Screens/HomeScreen.dart';
import 'package:todo_list_app/Screens/login_screen.dart';
import 'package:todo_list_app/components/my_button.dart';
import 'package:todo_list_app/components/my_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo_list_app/cubits/cubit/notes_cubit.dart';

import '../helper/show_snack_bar.dart';


class RegisterPage extends StatelessWidget {

  static String id = 'RegisterScreen';
  String? email;

  String? password;

  String? name;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NotesRegisterLoading){
          isLoading = true;
        }else if (state is NotesRegisterSuccess){
          Navigator.pushNamed(context, HomePage.id);
          showSnackBar(context, 'Welcome to our app');
        }else if (state is NotesRegisterFailure){
          showSnackBar(context, state.errMessage);
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/sign_up.svg',
                            width: 250,
                          ),
                          const SizedBox(height: 40,)
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Get On Board!',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Create your profile and start your joureny',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      MyTextFormField(
                          onChanged: (data) {
                            name = data;
                          },
                          hintText: 'Full Name',
                          obscureText: false,
                          prefixIcon: const Icon(Icons.person), suffixIcon: null,),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextFormField(
                          onChanged: (data) {
                            email = data;
                          },
                          hintText: 'Email',
                          obscureText: false,
                          prefixIcon: const Icon(Icons.mail), suffixIcon: null,),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextFormField(
                          onChanged: (data) {
                            password = data;
                          },
                          hintText: 'Password',
                          obscureText: true,
                          suffixIcon: const Icon(Icons.remove_red_eye),
                          prefixIcon: const Icon(Icons.key)),
                      const SizedBox(
                        height: 30,
                      ),
                      MyButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<NotesCubit>(context).signUp(email: email!, password: password!);
                          } else {}
                        },
                        text: 'Register',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'OR',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
