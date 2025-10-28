// lib/screens/splash_screen.dart

import 'package:flutter/material.dart';
import 'onboarding_screen.dart'; // We'll create this next!
import 'dart:async'; // For the timer

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    // Set a delay (e.g., 3 seconds) before navigating
    Timer(const Duration(seconds: 3), () {
      // Navigate to the Onboarding Flow (replace this with HomeScreen later if the user is already logged in!)
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // A Scaffold with a white background and centered content
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display your logo image
            Image(
              image: AssetImage('assets/images/logo.png'),
              height: 150, // Adjust size as needed
            ),
            // Optional: You can add a CircularProgressIndicator below the logo
            // if you need to indicate loading.
          ],
        ),
      ),
    );
  }
}