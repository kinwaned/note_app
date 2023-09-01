import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/Screens/login_screen.dart';
import 'package:todo_list_app/components/constants.dart';
import 'package:todo_list_app/components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static String id = 'SettingsPage';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _switchValue = false;

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 145),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                        const Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/image.JPG'),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    user.email!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 175,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text('3 Tasks left'),
                        ),
                      ),
                      Container(
                        width: 175,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text('0 Tasks left'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 290),
                    child: MyText(
                        text: 'Settings',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.nightlight_sharp),
                          const SizedBox(
                            width: 10,
                          ),
                          MyText(
                              text: 'App Mode',
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ],
                      ),
                      CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (value) {
                          setState(
                            () {
                              _switchValue = value;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 290),
                    child: MyText(
                        text: 'Account',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  MySettingsButton(
                    function: () {},
                    text: 'Change account name',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    myIcon: Icons.person,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MySettingsButton(
                    function: () {},
                    text: 'Change account password',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    myIcon: Icons.key,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MySettingsButton(
                    function: () {},
                    text: 'Change account image',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    myIcon: Icons.camera_alt_rounded,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 290),
                    child: MyText(
                        text: 'wTask',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  MySettingsButton(
                    function: () {},
                    text: 'About us',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    myIcon: Icons.grid_view_rounded,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MySettingsButton(
                    function: () {},
                    text: 'FAQ',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    myIcon: Icons.error,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MyButton(onTap: () {
                    setState(() {
                      singOut();
                      Navigator.pushNamed(
                        context, LoginPage.id,
                      );
                    });
                  }, text: 'Sing out')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> singOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
