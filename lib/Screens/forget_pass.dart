import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list_app/components/my_button.dart';
import 'package:todo_list_app/components/my_text_field.dart';

class ForgotPass extends StatelessWidget {
  const ForgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                const Center(
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Forgot Password',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Enter your email down below to reset your \n password',
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
                    hintText: 'Email',
                    obscureText: false,
                    prefixIcon: const Icon(Icons.email), suffixIcon: null,),
                const SizedBox(
                  height: 30,
                ),
                MyButton(
                  onTap: () {},
                  text: 'Send',
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
