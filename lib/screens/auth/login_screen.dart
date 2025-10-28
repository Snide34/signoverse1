// lib/screens/auth/login_screen.dart

import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import 'signup_screen.dart'; // We'll create this next

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // Placeholder function for social login
  void _socialLogin(String platform) {
    print('Attempting login with $platform');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The design doesn't show an AppBar, but a simple title is good practice
        title: const Text('Log In', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Access your account and bridge every conversation.',
              style: TextStyle(
                  fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 32),

            // Form Fields
            const CustomTextField(
              labelText: 'Email or Mobile Number',
              keyboardType: TextInputType.emailAddress,
            ),
            const CustomTextField(
              labelText: 'Password',
              isPassword: true,
            ),

            // Forget Password Link
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Forget Password?',
                    style: TextStyle(color: AppColors.primary)),
              ),
            ),
            const SizedBox(height: 16),

            // Login Button
            PrimaryButton(
              text: 'Log In',
              onPressed: () {
                // TODO: Implement login logic and navigate to HomeScreen
                print('Login Pressed');
              },
            ),
            const SizedBox(height: 24),

            // Social Login Divider
            Center(
              child: Text(
                'or sign in with',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 12),

            // Social Login Icons (Using generic icons here - replace with your assets)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialLoginIcon(
                  icon: Icons.facebook,
                  platform: 'Facebook',
                  onTap: () => _socialLogin('Facebook'),
                ),
                const SizedBox(width: 24),
                _SocialLoginIcon(
                  icon: Icons.language, // Use a better icon for Google if available
                  platform: 'Google',
                  onTap: () => _socialLogin('Google'),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Don't have an account link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? ",
                    style: TextStyle(fontSize: 16)),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
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

// A simple widget for the social icons
class _SocialLoginIcon extends StatelessWidget {
  final IconData icon;
  final String platform;
  final VoidCallback onTap;

  const _SocialLoginIcon({
    required this.icon,
    required this.platform,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
}