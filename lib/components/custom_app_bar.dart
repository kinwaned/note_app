import 'package:flutter/material.dart';

import '../Screens/settings_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'assets/fonts/Poppins-SemiBold.ttf'),
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
                icon:  Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
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
                icon:  const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
