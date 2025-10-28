// lib/screens/auth/signup_screen.dart

import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import '../home_screen.dart'; // Target screen after successful signup
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  // Placeholder function for social login
  void _socialLogin(String platform) {
    print('Attempting signup with $platform');
  }

  // A simple widget for the social icons (reused from login_screen)
  Widget _SocialLoginIcon({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: AppColors.darkText,
          size: 30,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header (Simple Title)
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),

            // Form Fields
            const CustomTextField(labelText: 'Full name'),
            const CustomTextField(
              labelText: 'Mobile Number',
              keyboardType: TextInputType.phone,
            ),
            const CustomTextField(
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const CustomTextField(
              labelText: 'Password',
              isPassword: true,
            ),
            const SizedBox(height: 16),

            // Terms and Privacy Text
            Center(
              child: Text(
                'By continuing you agree to Terms of Use and Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 16),

            // Sign Up Button
            PrimaryButton(
              text: 'Sign Up',
              onPressed: () {
                // TODO: Implement signup logic and navigate to HomeScreen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            const SizedBox(height: 24),

            // Social Login Divider
            Center(
              child: Text(
                'or sign up with',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 12),

            // Social Login Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialLoginIcon(
                  icon: Icons.facebook,
                  onTap: () => _socialLogin('Facebook'),
                ),
                const SizedBox(width: 24),
                _SocialLoginIcon(
                  icon: Icons.language,
                  onTap: () => _socialLogin('Google'),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Already have an account link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? ",
                    style: TextStyle(fontSize: 16)),
                GestureDetector(
                  onTap: () {
                    // Pop to remove the current screen and reveal the LoginScreen
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}