import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_plus/screens/sign_in_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Start a timer that will navigate to the main content after 4 seconds
    Timer(const Duration(seconds: 4), () {
      Get.off(SignInScreen()); // Navigate to the main content using GetX
    });

    return Scaffold(
      backgroundColor: const Color(0xFFFFE5E7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.height / 3,
            ),
            Image.asset('assets/splash.png', width: 250),
            Image.asset(
              'assets/loading.png',
              height: 250,
              width: 300,
            )
          ],
        ), // Replace with your splash image
      ),
    );
  }
}
