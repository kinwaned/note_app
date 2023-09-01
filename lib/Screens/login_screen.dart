// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list_app/Screens/HomeScreen.dart';
import 'package:todo_list_app/Screens/register_screen.dart';
import 'package:todo_list_app/components/my_button.dart';
import 'package:todo_list_app/components/my_text_field.dart';
import 'package:todo_list_app/cubits/cubit/notes_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';


class LoginPage extends StatelessWidget {

  bool isLoading = false;


  static String id = 'LoginPage';

  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  LoginPage({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NotesLoginLoading){
          isLoading = true;
        }else if (state is NotesLoginSuccess){
          Navigator.pushNamed(context, HomePage.id);
          showSnackBar(context, 'You\'re logged in');
        }else if (state is NotesLoginFailure){
          showSnackBar(context, state.errMessage);
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/sing_in.svg',
                            width: 250,
                          ),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome back',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Take control and make every moment matters',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      MyTextFormField(
                          controller: BlocProvider.of<NotesCubit>(context).emailController,
                          hintText: 'Email',
                          obscureText: false,
                          prefixIcon: const Icon(Icons.mail), suffixIcon: null,),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextFormField(
                          hintText: 'Password',
                          obscureText: true,
                          controller: BlocProvider.of<NotesCubit>(context).passwordController,
                          suffixIcon: const Icon(Icons.remove_red_eye),
                          prefixIcon: const Icon(Icons.key)),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 230),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<NotesCubit>(context).signIn();
                          } else {}
                        },
                        text: 'Login',
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
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/googleIcon.svg',
                                  width: 24,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Sign-in with Google',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'dont have an account?',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: const Text(
                              'Register',
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
