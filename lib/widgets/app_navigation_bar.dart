// lib/widgets/app_navigation_bar.dart (UPDATED to match the new image)

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../screens/home_screen.dart';
// NOTE: Make sure your screens (e.g., TranslationScreen) are imported
// if you want to use the pushReplacement logic.

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;

  // Custom icons to match the image:
  // Home, Translate (Text Swap), Dictionary (Book A-Z), Learning (Grad Cap), Profile
  static const List<_NavItem> _items = [
    _NavItem(icon: Icons.home_outlined, label: 'Home', index: 0),
    _NavItem(icon: Icons.translate_outlined, label: 'Translate', index: 1), // Using a standard icon for translation swap
    _NavItem(icon: Icons.menu_book_outlined, label: 'Dictionary', index: 2),
    _NavItem(icon: Icons.school_outlined, label: 'Learning', index: 3),
    _NavItem(icon: Icons.person_outline, label: 'Profile', index: 4),
  ];

  const AppNavigationBar({
    super.key,
    this.currentIndex = 0,
  });

  // Helper method to determine the destination screen (for basic routing)
  Widget _getScreen(int index) {
    // Returning HomeScreen as a placeholder for screens we haven't created yet
    return const HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    // 1. Wrap the entire bar in a Padding widget to ensure it doesn't overlap the phone's safe area (if not using SafeArea)
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
      child: Container(
        height: 65, // Fixed height for the bar
        decoration: BoxDecoration(
          color: AppColors.primary, // Dark teal color
          borderRadius: BorderRadius.circular(30), // Highly rounded corners
          boxShadow: [
            BoxShadow(
              color: AppColors.buttonShadow, // Dark shadow color
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _items.map((item) {
            final isSelected = item.index == currentIndex;
            // White for active, Grey for inactive
            final color = isSelected ? AppColors.lightText : AppColors.secondary;

            return InkWell(
              onTap: () {
                if (!isSelected) {
                  // NOTE: Use the actual screen if you want navigation to work!
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => _getScreen(item.index)),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(item.icon, color: color, size: 28),
                    // If you want to show labels, uncomment this (though the design image doesn't show them):
                    /*
                    Text(
                      item.label,
                      style: TextStyle(
                        color: color,
                        fontSize: 10,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    */
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// Simple class to hold navigation item data
class _NavItem {
  final IconData icon;
  final String label;
  final int index;
  const _NavItem({required this.icon, required this.label, required this.index});
}