import 'package:flutter/material.dart';

import '../Screens/settings_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notes',
              style: TextStyle(
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
                icon: const Icon(
                  Icons.search,
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
                icon: const Icon(
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
