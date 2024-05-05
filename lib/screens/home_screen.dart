import 'package:flutter/material.dart';
import 'package:pulse_plus/screens/chart.dart';
import 'package:pulse_plus/screens/doctor_info.dart';
import 'package:pulse_plus/screens/user_profile.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';
import 'package:pulse_plus/screens/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE5E7),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(children: [
                  PopupMenuButton<String>(
                    color: Colors.red[200],
                    onSelected: (String value) {
                      switch (value) {
                        case 'Screen 1':
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => const Profile()));
                          break;
                        case 'Screen 2':
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (c) => Chart()));
                          break;
                        case 'Screen 3':
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => const Doctor()));
                          break;
                        case 'Screen 4':
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => SignInScreen()));
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem<String>(
                        value: 'Screen 1',
                        child: Text('Profile'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Screen 2',
                        child: Text('Past Data'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Screen 3',
                        child: Text('Report to Doctor'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Screen 4',
                        child: Text('Sign Out'),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    color: Colors.red[900],
                    onPressed: () {},
                  )
                ])),
            const SizedBox(height: 70),
            const SemicircularIndicator(
              radius: 80,
              progress: 0.665,
              color: Color(0xFF7E1D19),
              backgroundColor: Color(0xFFEEA6A3),
              strokeWidth: 8,
              bottomPadding: 0,
              contain: true,
              child: Column(
                children: [
                  Text(
                    '66.5',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7E1D19)),
                  ),
                  Text(
                    'Latest BPM',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7E1D19)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
            const SemicircularIndicator(
              radius: 80,
              progress: 0.696,
              color: Color(0xFF7E1D19),
              backgroundColor: Color(0xFFF5A29C),
              strokeWidth: 8,
              bottomPadding: 0,
              contain: true,
              child: Column(
                children: [
                  Text(
                    '69.6',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7E1D19)),
                  ),
                  Text(
                    'Predicted BPM',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7E1D19)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
            const SemicircularIndicator(
              radius: 80,
              progress: 0.978,
              color: Color(0xFF7E1D19),
              backgroundColor: Color(0xFFF5A29C),
              strokeWidth: 8,
              bottomPadding: 0,
              contain: true,
              child: Column(
                children: [
                  Text(
                    '97.8',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7E1D19)),
                  ),
                  Text(
                    'Oxygen Level',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7E1D19)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
