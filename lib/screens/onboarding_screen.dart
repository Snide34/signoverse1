// lib/screens/onboarding_screen.dart

import 'package:flutter/material.dart';
import '../models/onboarding_content.dart';
import '../utils/app_colors.dart';
import '../widgets/onboarding_nav_button.dart';
import 'auth/login_screen.dart'; // We'll create this next

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Function to handle the next button tap
  void _onNextTap() {
    if (_currentPage == onboardingData.length - 1) {
      // Last page: Navigate to the Authentication/Login screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      // Not the last page: Move to the next page
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }

  // --- Widget for a single onboarding page ---
  Widget _buildPage(OnboardingContent content) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          // 1. Illustration (Takes about 40% of the screen height)
          SizedBox(
            height: screenHeight * 0.5,
            child: Image.asset(content.imagePath, fit: BoxFit.contain),
          ),

          // 2. Title
          Text(
            content.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 16),

          // 3. Description
          Text(
            content.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF6A6A6A), // A medium gray for body text
            ),
          ),
        ],
      ),
    );
  }

  // --- Widget for the dot indicator ---
  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: _currentPage == index ? 24.0 : 8.0, // Active dot is longer
      decoration: BoxDecoration(
        color: _currentPage == index ? AppColors.primary : AppColors.secondary,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return _buildPage(onboardingData[index]);
              },
            ),
          ),

          // The Bottom UI Section
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Page Indicator Dots
                Row(
                  children: List.generate(
                      onboardingData.length,
                          (index) => _buildDot(index)
                  ),
                ),

                // Navigation Button
                OnboardingNavButton(
                  onTap: _onNextTap,
                  isFinalPage: _currentPage == onboardingData.length - 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}