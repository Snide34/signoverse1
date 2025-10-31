import 'package:flutter/material.dart';
import '../widgets/app_navigation_bar.dart';
import '../utils/app_colors.dart';

// Import all main screens
import 'translation_screen.dart';
import 'dictionary_screen.dart';
import 'courses_screen.dart';
import 'profile_screen.dart';

// --- Placeholder for the actual Home Dashboard Content ---
class _HomeDashboardContent extends StatelessWidget {
  const _HomeDashboardContent();

  // Define asset paths for images (assuming assets/images/ is your directory)
  static const String _assetPathHelloHand = 'assets/images/hand_hello.png';
  static const String _assetPathTranslateHand = 'assets/images/hand_translate.png';
  static const String _assetPathDictionary = 'assets/images/dictionary_book.png';
  static const String _assetPathCourses = 'assets/images/graduation_cap.png';
  static const String _assetPathTimeRoutine = 'assets/images/calendar.png';
  static const String _assetPathGreetings = 'assets/images/people_talking.png';
  static const String _assetPathProfile = 'assets/images/profile_avatar.png';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOP HEADER: Profile Image, Welcome Text, Hand Icon, Settings Icon
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(_assetPathProfile),
                  radius: 24,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Hey, Welcome', style: TextStyle(fontSize: 14, color: AppColors.darkText)),
                    Text('Mahi Kandari', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.darkPrimary)),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.back_hand_outlined, color: AppColors.darkText), // Hand Icon
                const SizedBox(width: 15),
                IconButton(
                  icon: const Icon(Icons.settings, color: AppColors.darkText),
                  onPressed: () { /* Navigate to Settings */ },
                ),
              ],
            ),
            const SizedBox(height: 30),

            // MAIN CTA SECTION (Title, Description, Card, and Illustration)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back —\nready to connect?',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.darkPrimary, height: 1.2),
                      ),
                      const SizedBox(height: 8),
                      // Text below the title
                      const Text(
                        'Connect effortlessly through real-time sign and speech translation.',
                        style: TextStyle(fontSize: 12, color: AppColors.darkText),
                      ),
                    ],
                  ),
                ),
                // Hello Hand Illustration (Top Right)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 10),
                  child: Image.asset(
                    _assetPathHelloHand,
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Translate Everything Card (Using Stack for overlapping illustration)
            Stack(
              clipBehavior: Clip.none, // Allows the illustration to overflow if needed
              children: [
                // 1. Translation Card (Main Content Container)
                Container(
                  width: double.infinity,
                  height: 190, // Adjusted height for aesthetics
                  padding: const EdgeInsets.only(left: 25, top: 25, bottom: 25), // Left padding for text
                  decoration: BoxDecoration(
                    color: AppColors.darkPrimary,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.darkPrimary.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text is aligned to the left
                      Text(
                        'Translate\nEverything',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.background, height: 1.0),
                      ),
                      // The Start Button (Aligned to the left)
                      ElevatedButton(
                        onPressed: () {
                          final _HomeScreenState? parentState = context.findAncestorStateOfType<_HomeScreenState>();
                          parentState?._onItemSelected(1);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          elevation: 0,
                        ),
                        child: const Text('Start', style: TextStyle(color: AppColors.darkText, fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ],
                  ),
                ),

                // 2. Translate Hand Illustration (Inside Card, Aligned Right)
                Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    _assetPathTranslateHand,
                    width: 170, // Slightly smaller width to fit the design better
                    height: 170,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // FEATURE CARDS ROW (Sign Dictionary and Language Courses)
            Row(
              children: [
                // Sign Dictionary Card (Index 2)
                Expanded(child: _buildFeatureCard(context, 'Sign Dictionary', _assetPathDictionary, AppColors.surface, 2)),
                const SizedBox(width: 15),
                // Language Courses Card (Index 3)
                Expanded(child: _buildFeatureCard(context, 'Language courses', _assetPathCourses, AppColors.surface, 3)),
              ],
            ),
            const SizedBox(height: 30),

            // LEARN SECTION
            Text(
              'Learn sign language',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.darkPrimary),
            ),
            const SizedBox(height: 15),

            // Learn Cards Row
            Row(
              children: [
                // Learn Card 1 (Time and Routine)
                Expanded(
                  child: _buildLearningCard(
                    'Learn to Sign Time and Routine',
                    'Master signs for days of the week, morning, night, today, and tomorrow —',
                    _assetPathTimeRoutine,
                  ),
                ),
                const SizedBox(width: 15),
                // Learn Card 2 (Common Words & Greetings)
                Expanded(
                  child: _buildLearningCard(
                    'Common Words & Greetings',
                    'Learn the most common words and greetings in sign to get started.',
                    _assetPathGreetings,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // Helper function for feature cards
  Widget _buildFeatureCard(BuildContext context, String title, String assetPath, Color color, int targetIndex) {
    return GestureDetector(
      onTap: () {
        final _HomeScreenState? parentState = context.findAncestorStateOfType<_HomeScreenState>();
        parentState?._onItemSelected(targetIndex);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 140,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkPrimary.withOpacity(0.15),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.darkPrimary)),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(assetPath, height: 60, fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function for learning cards
  Widget _buildLearningCard(String title, String description, String assetPath) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkPrimary.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Using ClipRRect to round corners of the image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(assetPath, height: 100, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.darkPrimary)),
          const SizedBox(height: 4),
          Text(description, style: const TextStyle(fontSize: 10, color: AppColors.darkText)),
        ],
      ),
    );
  }
}

// --- Main Stateful Screen for Navigation Management ---
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // State to track the currently selected index in the bottom navigation bar.
  int _currentIndex = 0;

  // List of all the main screens corresponding to the navigation icons.
  final List<Widget> _screens = [
    const _HomeDashboardContent(), // Index 0: The actual dashboard
    const TranslationScreen(),
    const DictionaryScreen(), // Index 2
    const CoursesScreen(),    // Index 3
    const ProfileScreen(),    // Index 4
  ];

  // Handler for when a navigation item is tapped.
  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // The body only shows the screen corresponding to the current index.
      body: SafeArea(
        child: _screens[_currentIndex],
      ),

      // The bottom navigation bar is always visible and handles state changes.
      bottomNavigationBar: AppNavigationBar(
        currentIndex: _currentIndex,
        onItemSelected: _onItemSelected,
      ),
    );
  }
}
