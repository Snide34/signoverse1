import 'package:flutter/material.dart';
// Import utility classes
import 'utils/app_colors.dart';
// Import all screens from the 'screens' directory
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/home_screen.dart';
import 'screens/translation_screen.dart';
import 'screens/sign_dictionary_screen.dart'; // Assuming this is the main dictionary entry
import 'screens/sign_detail_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/edit_info_screen.dart';
// Import Auth screens
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignSense Translator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Set the primary color for the overall app theme
        primaryColor: AppColors.primary,
        // Set the background color for the main scaffold
        scaffoldBackgroundColor: AppColors.lightBackground,
        // Configure the AppBar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.lightBackground,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          iconTheme: IconThemeData(
            color: AppColors.darkText,
          ),
        ),
        // Use the visual density for adaptive layouts
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Define text selection color for better contrast
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.action,
          selectionColor: AppColors.secondary,
          selectionHandleColor: AppColors.action,
        ),
        fontFamily: 'Roboto',
      ),

      // Define named routes for navigation
      // Initial route is usually the Splash screen or Onboarding screen
      initialRoute: '/splash',
      routes: {
        // Core Navigation
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/': (context) => const HomeScreen(), // Home screen after auth/onboarding

        // Main Feature Screens
        '/translation': (context) => const TranslationScreen(),
        '/dictionary': (context) => const SignDictionaryScreen(),
        // Note: SignDetailScreen requires an argument, so it's typically pushed,
        // but we define it here for completeness.
        '/sign_detail': (context) => const DictionaryDetailScreen(letter: '',), // FIX: Corrected typo (SignD=etailScreen -> SignDetailScreen)

        // User & Utility Screens
        '/profile': (context) => const ProfileScreen(),
        '/edit_info': (context) => const EditInfoScreen(),

        // Authentication Screens
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),      },
    );
  }
}
