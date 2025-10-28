// lib/main.dart

import 'package:flutter/material.dart';

// Utilities
import 'utils/app_colors.dart';

// Screens (ensure these files are created in their respective directories!)
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/dictionary_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign-o-verse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Theme Setup (using AppColors)
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.darkText),
          bodyMedium: TextStyle(color: AppColors.darkText),
        ),
        useMaterial3: true,
      ),

      // --- Named Routing Setup ---
      // 1. Define the starting point.
      initialRoute: '/',

      // 2. Map route names to screen widgets.
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
        '/dictionary': (context) => const DictionaryScreen(), // <--- NEW ROUTE
      },
    );
  }
}