// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/feature_card.dart';
import '../widgets/app_navigation_bar.dart'; // Assumed to exist
import 'translation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- Use the custom bottom navigation bar ---
      // NOTE: Ensure you create the AppNavigationBar widget separately!
      bottomNavigationBar: const AppNavigationBar(),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Custom Header / App Bar Area
            _buildCustomHeader(context),

            // 2. Main Content Area
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Primary Translation Card ---
                  FeatureCard(
                    title: 'Translate Everything',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const TranslationScreen()),
                      );
                    },
                    backgroundColor: AppColors.primary,
                    isPrimary: true,
                    height: 180,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const TranslationScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightText,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Start', style: TextStyle(color: AppColors.primary)),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // --- Secondary Cards (Dictionary and Learning) in a Row ---
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: FeatureCard(
                          title: 'Sign Dictionary',
                          onTap: () => print('Go to Dictionary'),
                          backgroundColor: AppColors.secondary,
                          height: 150,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: FeatureCard(
                          // Renamed from 'Learn all languages' to 'Language courses'
                          title: 'Language courses',
                          onTap: () => print('Go to Language Courses'),
                          backgroundColor: AppColors.secondary,
                          height: 150,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // --- NEW SECTION: Popular ---
                  const Text(
                    'Popular',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.darkText),
                  ),
                  const SizedBox(height: 16),

                  // Using a ListView.builder for horizontal scrolling cards
                  SizedBox(
                    height: 270, // Height to accommodate the card and its content
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // The main Popular card
                        _buildPopularContentCard(context),
                        const SizedBox(width: 16),
                        // Additional cards can be added here
                        _buildPopularContentCard(context),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- New Widget: Popular Content Card (Modified for ListView) ---
  Widget _buildPopularContentCard(BuildContext context) {
    // Increased width slightly to look better in a scrollable list
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () {
          print('Go to Popular Words');
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Common Words & Greetings',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.darkText),
              ),
              const SizedBox(height: 4),
              Text(
                'Learn the most common words and greetings in sign language',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/images/common_signs.png', // Save your illustration here
                  height: 180, // Adjusted height for better fit
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Custom Header Widget (Your existing code) ---
  Widget _buildCustomHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16, // Respects status bar
        left: 24,
        right: 24,
        bottom: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Profile and Settings
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Profile Photo and Welcome Text
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hey, Welcome', style: TextStyle(fontSize: 12)),
                      Text('Mahi Kandari', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              // Icons (Hands and Settings)
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.back_hand_outlined, color: AppColors.primary),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: AppColors.primary),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Row 2: Large Heading and Illustration
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome back — ready to connect?',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Connect effortlessly through real-time sign and speech translation.',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              // Illustration (Hands)
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/header_illustration.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}