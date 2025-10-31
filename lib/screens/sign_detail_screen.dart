import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

// -------------------------------------------------------------------
// SCREEN: Word List for a specific letter (e.g., all 'A' words)
// -------------------------------------------------------------------
class DictionaryDetailScreen extends StatelessWidget {
  final String letter;

  const DictionaryDetailScreen({super.key, required this.letter});

  // Mock word list for demonstration
  static const Map<String, List<String>> _mockWords = {
    'A': ['Abacus', 'Ability', 'Aboriginal', 'Above', 'Accept', 'Accurate', 'Act', 'Active', 'Adult', 'After'],
    'B': ['Baby', 'Back', 'Bad', 'Bag', 'Ball', 'Ban', 'Band', 'Bank', 'Bar', 'Base'],
    'C': ['Calculate', 'Calendar', 'Call', 'Calm', 'Can', 'Candy', 'Cap', 'Car', 'Care', 'Case'],
    'Popular': ['Hello', 'Thank You', 'Please', 'Yes', 'No', 'Good', 'Bad', 'Help', 'Friend', 'Family']
  };

  @override
  Widget build(BuildContext context) {
    final words = _mockWords[letter] ?? ['No words found'];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          letter == 'Popular' ? 'Popular Signs' : 'Words starting with "$letter"',
          style: const TextStyle(color: AppColors.lightText, fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.darkPrimary,
        iconTheme: const IconThemeData(color: AppColors.lightText),
      ),
      body: Column(
        children: [
          // --- Search Bar Section ---
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: AppColors.surface, // White background
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primary.withAlpha(128)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkText.withAlpha(13),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for a sign or word...',
                  hintStyle: TextStyle(color: AppColors.darkText, fontSize: 16),
                  icon: Icon(Icons.search, color: AppColors.primary),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: AppColors.darkText),
              ),
            ),
          ),

          // --- Word List Section ---
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: words.length,
              itemBuilder: (context, index) {
                final word = words[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Card(
                    color: AppColors.surface,
                    elevation: 1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      title: Text(
                          word,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.darkText)
                      ),
                      // Mock sign image thumbnail (using an icon as a placeholder)
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.lightBackground, // Light gray circle
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.front_hand_outlined, color: AppColors.darkPrimary.withAlpha(204), size: 24),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.darkPrimary),
                      onTap: () {
                        // Action: Navigate to Sign Detail Screen
                        // TODO: Fix navigation to SignDetailScreen. The screen is not defined.
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SignDetailScreen(word: word),
                        //   ),
                        // );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // Note: This screen is a sub-page, so it does not include the AppNavigationBar.
    );
  }
}
