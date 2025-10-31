import 'package:flutter/material.dart';
import '../widgets/app_navigation_bar.dart';
import '../utils/app_colors.dart';
import 'package:signoverse/screens/sign_detail_screen.dart';

// -------------------------------------------------------------------
// MAIN SCREEN: Sign Dictionary Grid (A-Z)
// -------------------------------------------------------------------
class SignDictionaryScreen extends StatelessWidget {
  const SignDictionaryScreen({super.key});

  // Data for the grid (A-Z)
  static const List<String> _alphabet = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
    'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  ];

  // Helper function to build a single letter tile
  Widget _buildLetterTile(BuildContext context, String letter) {
    // Determine the asset path based on the letter.
    // You will replace this with your actual asset loading logic.
    final String assetPath = 'assets/signs/${letter.toLowerCase()}.png';

    // Mocking the 'B' selection highlight from the initial UI image for demo purposes.
    final bool isSelected = letter == 'B';

    return GestureDetector(
      onTap: () {
        // Navigate to the Dictionary Detail Screen (the word list)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DictionaryDetailScreen(letter: letter,)),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular sign image container
          Container(
            height: 70, // Increased size slightly to match design
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightBackground, // Light gray/off-white background
              border: isSelected
                  ? Border.all(color: AppColors.action, width: 3) // Blue border for selected state
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(13),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                assetPath,
                fit: BoxFit.cover, // Ensures the image fills the circle
                // Placeholder/Error handling for when you haven't added the assets yet
                errorBuilder: (context, error, stackTrace) => Center(
                  child: Icon(
                    Icons.front_hand_outlined,
                    size: 40,
                    color: AppColors.darkText.withAlpha(153),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            letter,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // Use light background color
      appBar: AppBar(
        // The Figma design uses the primary color (Teal) for the AppBar background.
        backgroundColor: AppColors.primary,
        title: const Text(
          'Sign Dictionary',
          style: TextStyle(color: AppColors.lightText, fontWeight: FontWeight.w600),
        ),
        // Ensures the back button is white
        iconTheme: const IconThemeData(color: AppColors.lightText),
        // The leading widget shows an explicit back button in the Figma design
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // Use iOS-style arrow for a modern look
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: GridView.builder(
          // Responsive grid: 4 columns as seen in the Figma design (A, B, C, D)
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 25.0, // Increased spacing between rows
            childAspectRatio: 0.85, // Adjusted for the ratio of the circular icon and text below it
          ),
          itemCount: _alphabet.length,
          itemBuilder: (context, index) {
            return _buildLetterTile(context, _alphabet[index]);
          },
        ),
      ),
      // Index 2 corresponds to the Dictionary icon in the AppNavigationBar
      bottomNavigationBar: AppNavigationBar(currentIndex: 2, onItemSelected: (int value) {  },),
    );
  }
}
